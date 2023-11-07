// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    enum Item { None, GiftCard, Headset, Watch, VRHeadset, iPhone }

    mapping(address => Item) public inventory;
    mapping(address => mapping(uint256 => uint256)) public itemQuantities; // New mapping to store quantities

    constructor() ERC20("Degen", "DGN") {}

    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function spinRoulette() public {
        require(balanceOf(msg.sender) >= 500, "Insufficient balance to spin the roulette");

        uint256 randomNumber = uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, msg.sender))) % 100;

        uint256 rewardIndex = randomNumber % 20;

        Item reward = getItemByIndex(rewardIndex);

        if (reward != Item.None) {
            inventory[msg.sender] = reward;
            itemQuantities[msg.sender][uint256(reward)]++; // Increment quantity
        }

        _burn(msg.sender, 500); // Burn 500 tokens for spinning
    }

    function getItemByIndex(uint256 index) internal pure returns (Item) {
        if (index < 8) {
            return Item.GiftCard;
        } else if (index < 12) {
            return Item.Headset;
        } else if (index < 14) {
            return Item.Watch;
        } else if (index == 14) {
            return Item.VRHeadset;
        } else if (index == 15) {
            return Item.iPhone;
        } else {
            return Item.None;
        }
    }

    function getInventory(address user) public view returns (Item, uint256) {
        return (inventory[user], itemQuantities[user][uint256(inventory[user])]);
    }
}
