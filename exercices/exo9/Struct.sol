// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract Struct {
    struct Info{
        string username;
        uint256 age;
        address account;
        string grade;
        bool isAlive;
    }

        Info[] public infos ;

    function addInfo(string calldata _username, uint256 _age, address _account, string calldata _grade, bool _isAlive) public{
        infos.push(Info(_username, _age, _account, _grade, _isAlive));
    }

    function removeInfo(uint256 _index) public{
         require(_index < infos.length, "Invalid index");
        infos[_index].isAlive = false;
    }
    function updateUser(uint256 _index,string memory _username, uint256 _age, string memory _grade) public {
         require(_index < infos.length, "Invalid index");
        infos[_index].username = _username;
        infos[_index].age = _age;
        infos[_index].grade = _grade;
    }
    function getUserInfo(uint _index) public view returns (string memory, uint256, address, string memory, bool) {
        require(_index < infos.length, "Invalid index");
        Info storage info = infos[_index];
        return (info.username, info.age, info.account, info.grade, info.isAlive);
    }
    } 



