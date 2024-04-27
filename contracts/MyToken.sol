// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public owner;
    uint256 public taxPercentage;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply,
        uint8 decimals
    ) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply * (10 ** decimals));
        owner = msg.sender; // Set the contract deployer as the owner
    }

    function _calculateTax(uint256 amount) internal view returns (uint256) {
        return (amount * taxPercentage) / 100; // Calculate tax amount
    }

    function transfer(
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        uint256 taxAmount = _calculateTax(amount);
        uint256 transferAmount = amount - taxAmount;

        _transfer(msg.sender, recipient, transferAmount);
        if (taxAmount > 0) {
            _transfer(msg.sender, address(this), taxAmount);
        }
        return true;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    function updateTaxPercentage(uint256 _taxPercentage) public onlyOwner {
        taxPercentage = _taxPercentage; // Update taxation percentage
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply();
    }
}
