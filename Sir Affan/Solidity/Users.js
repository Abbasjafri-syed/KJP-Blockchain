// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Task {
    address _owner;
    address[] public users;
    uint256[] public value;
    mapping(address => mapping(string => mapping(string => uint256))) public infoDetail;

    constructor() {
        _owner == msg.sender;
    }
    modifier onlyOwner {
        require(_owner == msg.sender,"only owner function");
        _;
    }

    receive() external payable {
        users.push(msg.sender);
        value.push(msg.value);
    }

    function bulkTransfer() onlyOwner external payable{
        for (uint256 i = 0; i < users.length; i++){
            payable(users[i]).transfer(value[i]);
        }
        delete users;
        delete value;
    }
    
    function withdrawFunds(uint256 _amount) external payable{
        require(msg.value == 10,"Please give 10 wei");
        require(_amount < address(this).balance, "amount is equal or greater than balance of contract");
        payable(msg.sender).transfer(_amount);
    }
    

} 
