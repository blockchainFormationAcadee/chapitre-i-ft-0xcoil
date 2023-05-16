// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;

import "remix_tests.sol";
import "remix_accounts.sol";
import "../contracts/RushChapterI.sol";

contract RushChapterITests {
    RushChapterI public rushChapterI;

    constructor() {
        rushChapterI = new RushChapterI();
    }

    function testFillDish() public {
        (uint256 initialQuantity, uint256 initialRemaining) = rushChapterI.dishQuantity(RushChapterI.Dish.ICE_TEA);

        // Appel de la fonction fillDish pour ajouter 5 ICE_TEA
        rushChapterI.fillDish(RushChapterI.Dish.ICE_TEA, 5);

        (uint256 updatedQuantity, uint256 updatedRemaining) = rushChapterI.dishQuantity(RushChapterI.Dish.ICE_TEA);

        // Verify that the quantity has been updated correctly
        Assert.equal(updatedQuantity, initialQuantity + 5, "Incorrect updated quantity");

        // Verify that the remaining quantity has been updated correctly
        Assert.equal(updatedRemaining, initialRemaining + 5, "Incorrect updated remaining quantity");
    }
}
