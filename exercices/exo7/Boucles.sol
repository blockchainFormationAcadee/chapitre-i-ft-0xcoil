// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract Array {
        int256[10] public array= [int256(42), int256(-86), int256(69), int256(30), int256(-85563), int256(0), int256(0), int256(0), int256(0), int256(0)];

    function get(uint8 index) public view returns (int256) {
        return array[index];
    }

    function set(uint8 index, int256 value) public {
         array[index] = value;
    }

    function icrementArrayFor() public {
        for (uint8 i = 0; i < array.length; i++){
            array[i] +=1;
        }
    }
    
    function incrementArrayWhile() public {
            uint8 j;
            while (j < array.length){
                array[j] +=1;
                j++;
            }
         }
}
