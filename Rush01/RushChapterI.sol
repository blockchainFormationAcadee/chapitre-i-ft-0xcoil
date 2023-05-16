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
        require(quantity < 0, "Pas assez de plats dispo");
        require(dishQuantity[dish].remaining >= quantity, "Plus de plats");

                dishQuantity[dish].remaining -= quantity;

        return(dish, quantity, dishQuantity[dish].remaining);
    }

    function fillDish(Dish dish, uint256 quantity) public returns (uint256, uint256) {
        require(quantity > 0, "La quantite doit etre superieure a 0");
        require(dishQuantity[dish].quantity + quantity <= maxItems, "Trop ajoute");

            dishQuantity[dish].quantity += quantity;
            dishQuantity[dish].remaining += quantity;

        return(dishQuantity[dish].remaining, quantity);
    }
}