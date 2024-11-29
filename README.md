# DegenToken Smart Contract

## Overview
DegenToken is an ERC20-compliant token deployed on the Avalanche Fuji Testnet. The contract allows minting, burning, and redeeming tokens for in-game items. It also tracks user-owned items and their stock levels within the contract.

---

## Features
- **Minting**: The contract owner can mint new tokens.
- **Burning**: Any token holder can burn tokens.
- **Inventory Management**: 
  - The owner can add new items to the store.
  - Users can redeem tokens to purchase items.
  - Users can check the stock of items and their personal item balance.
- **Event Logging**: Emission of events when items are redeemed.

---

## Contract Details
- **Token Name**: Degen
- **Symbol**: DGN
- **Decimals**: 0
- **Network**: Avalanche Fuji Testnet

---

## Contract Functions

### Public Functions
- `mint(address to, uint256 amount)`  
  Mint new tokens. Only callable by the owner.
  
- `burn(uint256 amount)`  
  Burn tokens from the caller's account.

- `viewInventory()`  
  Returns the list of all available items in the store.

- `checkItemStock(uint256 itemId)`  
  Returns the name and stock of a specific item by its ID.

- `redeemItem(uint256 itemId, uint256 quantity)`  
  Redeem tokens to purchase an item. Checks for sufficient balance and item stock.

- `checkUserItems(address user, uint256 itemId)`  
  Returns the quantity of a specific item owned by a user.

---

## Deployment Instructions

### Prerequisites
- **MetaMask** installed and configured for the Avalanche Fuji Testnet.
- **Remix IDE** ([remix.ethereum.org](https://remix.ethereum.org)).

### Steps
1. Open **Remix IDE** and load the `DegenToken` contract.
2. Compile the contract using the **Solidity Compiler**.
3. Switch to the **"Deploy & Run Transactions"** tab.
4. Select **Injected Provider - MetaMask** under Environment.
5. Deploy the contract, and confirm the transaction in MetaMask.
6. Copy the deployed contract address for verification.

---

## Verifying the Contract on Snowtrace
1. Visit [Snowtrace Testnet](https://testnet.snowtrace.io).
2. Search for your contract address and click **"Verify and Publish"**.
3. Enter the following details:
   - **Compiler Version**: Same as used in Remix.
   - **License**: MIT.
4. Paste your Solidity code and click **"Verify"**.
5. Upon successful verification, your contract will be accessible via Snowtrace.

---

### Author
Shawn Aaron Quirante
