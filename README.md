# DegenToken Smart Contract

The DegenToken is a Solidity smart contract that represents a simple ERC-20 token with additional functionality for a roulette-style item rewards system. This README provides an overview of the contract and how to use it.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The DegenToken smart contract is built on the Ethereum blockchain and utilizes the OpenZeppelin ERC-20 and Ownable libraries. It introduces an item-based rewards system where users can "spin" a roulette to win various items based on their token balance.

## Features

1. **ERC-20 Token**: DegenToken is a standard ERC-20 token, allowing for standard token operations such as transfer, minting, and burning.

2. **Item Rewards**: Users can participate in a roulette-style game to win various items, such as Gift Cards, Headsets, Watches, VR Headsets, and iPhones.

3. **Item Quantities**: The contract keeps track of the quantities of each item won by a user.

4. **Owner Minting**: The contract owner can mint new tokens.

## Getting Started

### Prerequisites

Before using the DegenToken smart contract, you need the following:

- An Ethereum development environment or a testnet for deploying the contract.

### Installation

1. Clone the repository.

2. Compile and deploy the contract using a Solidity development environment or a tool like Remix.

## Usage

The contract provides the following key functions:

- `mint(uint256 amount)`: Allows the contract owner to mint new tokens.

- `burn(uint256 amount)`: Allows users to burn their own tokens.

- `transfer(address to, uint256 amount)`: Overrides the ERC-20 `transfer` function to enable transfers.

- `spinRoulette()`: Allows users to participate in the roulette game, spending 500 tokens to potentially win items.

- `getInventory(address user)`: Retrieves the item and its quantity owned by a user.

## Contributing

Contributions to this project are welcome. If you'd like to contribute, please follow the standard GitHub pull request process.

## License

This smart contract is licensed under the MIT License. You can find the full license text in the `LICENSE` file.

**Note:** This README is a general template and should be customized to suit your project's specific details and requirements.
