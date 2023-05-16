// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract RushChapterI {

    enum Dish {
        ICE_TEA, 
        MARS,
        LION,
        FANTA,
        COCA_COLA
    }

    struct DishData{
        uint256 quantity;
        uint256 remaining;
    }

    mapping (Dish => DishData) public dishQuantity;
    uint256 public maxItems=42;

    function getDish(Dish dish, uint256 quantity) public returns (Dish,uint,uint) {
        require(quantity < 0, "Not enough dishes available");
        require(dishQuantity[dish].remaining >= quantity, "No more dishes");

                dishQuantity[dish].remaining -= quantity;

        return(dish, quantity, dishQuantity[dish].remaining);
    }

    function fillDish(Dish dish, uint256 quantity) public returns (uint256, uint256) {
        require(quantity > 0, "Quantity must be over 0");
        require(dishQuantity[dish].quantity + quantity <= maxItems, "Too much quantity");

            dishQuantity[dish].quantity += quantity;
            dishQuantity[dish].remaining += quantity;

        return(dishQuantity[dish].remaining, quantity);
    }
}