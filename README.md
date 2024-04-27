# ERC-20-on-Sepolia-Testnet

<br>
1- First of all clone the repo in your local. <br><br>
2- Move to the location then copy the following command and run in your terminal:

```bash
npm install --force
```
3- Navigate to your project folder in the terminal and run:


```bash
npx hardhat
```
4- Rename the 'dev.env' file to '.env'
- paste your metamask private key in the 'PRIVATE_KEY' variable.
- paste your Sepolia Endpoint of Infura in the 'INFURA_SEPOLIA_ENDPOINT' variable. <br><br>

5- Before proceeding, it is important to ensure that you have enough funds in your MetaMask wallet. If your wallet does not have sufficient funds, a transaction error will occur, and you will see a message indicating the insufficient funds on your terminal. To prevent this error, please make sure to fund your account by following this [Link](https://www.alchemy.com/faucets/ethereum-sepolia).<br><br>


6- To initiate the deployment of your contract, execute the code below within your terminal:

```bash
npx hardhat run --network sepolia scripts/deploy.ts
```

7- After running the command please wait for a few seconds. <br><br>

8- If everything went well, you will see balance before and after transaction on your console along with the Transaction hash. <br><br>

9- Ctrl + click on the transaction hash that is present in the terminal. It will take you to the Sepolia Etherscan, just click on the transaction hash and you will see all the details and the functions performed in the contract. <br><br>

10- If somehow you can not see all the processes performed, you can hard refresh the browser Ctrl + F5 (windows) and at least five concurrent processes performing will be shown in the token history. <br><br>

11- The main function takes four parameters and you can move forward and change them if you would like to according to your needs. <br><br>


12- Name of the token is `MyToken` and the abbreviation for it is `MTk`you can import it in your metamask and share with your other accounts to see the taxation. If you don't know how to import tokens click on this [link](https://support.metamask.io/managing-my-tokens/custom-tokens/how-to-display-tokens-in-metamask/). <br><br>



# MyToken Contract Functions


## Contract Ownership
- **Description:** Allows the current owner of the contract to transfer ownership to another address.
- **Modifier:** `onlyOwner`
- **Parameters:**
  - `newOwner`: Address of the new owner.

## Taxation on Swap
- **Description:** Allows the contract owner to update the tax percentage applied to transfers.
- **Modifier:** `onlyOwner`
- **Parameters:**
  - `_taxPercentage`: New tax percentage to be applied.

## Transfer
- **Description:** Transfers tokens from sender to recipient with taxation applied.
- **Parameters:**
  - `recipient`: Address receiving the tokens.
  - `amount`: Amount of tokens to transfer.

## Mint
- **Description:** Mints new tokens and adds them to the total supply.
- **Modifier:** `onlyOwner`
- **Parameters:**
  - `account`: Address to which the minted tokens will be assigned.
  - `amount`: Amount of tokens to mint.

## Burn
- **Description:** Burns (destroys) tokens, reducing the total supply.
- **Parameters:**
  - `amount`: Amount of tokens to burn.

## Get Total Supply
- **Description:** Retrieves the total supply of tokens in circulation.





