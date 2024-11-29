// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    struct Item {
        string name;
        uint256 price;
        uint256 stock;
    }

    mapping(uint256 => Item) public inventory;  // Store's inventory
    mapping(address => mapping(uint256 => uint256)) public userItems;  // User's item balances

    uint256 public totalItems;

    constructor() ERC20("Degen", "DGN") {
        _mint(msg.sender, 0);
        addItem("Sword", 50, 10);
        addItem("Shield", 75, 5);
        addItem("Health Potion", 25, 20);
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function addItem(string memory _name, uint256 _price, uint256 _stock) public onlyOwner {
        inventory[totalItems] = Item(_name, _price, _stock);
        totalItems++;
    }

    function viewInventory() public view returns (Item[] memory) {
        Item[] memory items = new Item[](totalItems);
        for (uint256 i = 0; i < totalItems; i++) {
            items[i] = inventory[i];
        }
        return items;
    }

    function checkItemStock(uint256 itemId) public view returns (string memory itemName, uint256 stock) {
        require(itemId < totalItems, "Invalid item ID.");
        Item memory item = inventory[itemId];
        return (item.name, item.stock);
    }

    function redeemItem(uint256 itemId, uint256 quantity) public {
        require(itemId < totalItems, "Invalid item ID.");
        Item storage item = inventory[itemId];
        uint256 totalCost = item.price * quantity;
        require(balanceOf(msg.sender) >= totalCost, "Insufficient tokens.");
        require(item.stock >= quantity, "Not enough stock available.");
        
        _burn(msg.sender, totalCost);
        item.stock -= quantity;
        userItems[msg.sender][itemId] += quantity;

        emit ItemRedeemed(msg.sender, item.name, quantity);
    }

    function checkUserItemBalance(address user, uint256 itemId) public view returns (string memory itemName, uint256 quantityOwned) {
        require(itemId < totalItems, "Invalid item ID.");
        Item memory item = inventory[itemId];
        return (item.name, userItems[user][itemId]);
    }

    event ItemRedeemed(address indexed redeemer, string itemName, uint256 quantity);
}
