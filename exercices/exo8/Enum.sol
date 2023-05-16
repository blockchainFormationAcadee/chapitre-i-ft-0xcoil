// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract Enum {
    enum Types {
        OWNER, 
        CUSTOMER, 
        FRIEND, 
        DEVELOPER
}

   mapping(address => Types) public addressType;

    function getAddressType(address addr) public view returns (Types) {
        return addressType[addr];
    }

    function setAddressType(address addr, Types  _type) public {
         addressType[addr]= _type;
    }
}