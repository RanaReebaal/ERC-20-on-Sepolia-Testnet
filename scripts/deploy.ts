
const hre = require("hardhat");
const { formatEther } = require("ethers");
const { ethers } = require("ethers");


async function main() {
  // Fetching the signer's address
  const accounts = await hre.ethers.getSigners();
  const signerAddress = await accounts[0].getAddress();


  // Fetching and printing the ETH balance before deployment
  const balanceBefore = await hre.ethers.provider.getBalance(signerAddress);
  console.log("ETH balance before deployment:", formatEther(balanceBefore));

  // Deploying the token contract
  const MyToken = await hre.ethers.getContractFactory("MyToken");
  const myToken = await MyToken.deploy("MyToken", "MTK", 100000, 18);
  await myToken.waitForDeployment()

  // Assigning ownership to the deployer
  await myToken.transferOwnership(signerAddress); // Assuming transferOwnership function exists in your contract

  // Update taxation percentage if needed
  await myToken.updateTaxPercentage(5); // Update taxation percentage (e.g., 5%)

  // Minting additional tokens (e.g., 500 tokens)
  await myToken.mint(signerAddress, 500);

  // Burning some tokens (e.g., 100 token)
  await myToken.connect(accounts[0]).burn(100);

  // Fetching and printing the ETH balance after deployment
  if (myToken){
    const balanceAfter = await hre.ethers.provider.getBalance(signerAddress);
    console.log("ETH balance after deployment:", formatEther(balanceAfter));
  }

  // Printing out the link to a blockchain explorer for the transaction
  console.log("Transaction:", `https://sepolia.etherscan.io/address/${myToken.target}`);

}


main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});





