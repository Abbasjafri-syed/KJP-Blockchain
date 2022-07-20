
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import  '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';

contract delegatemultiple {

    address public owner;
    address[] public delegate;

    constructor() {
        owner = msg.sender;
    }  

 mapping (address => mapping (address => uint256)) private approve;
   function makedelegate(address sp1) public payable{
    require (msg.sender == owner, 'Only Owner Right to assign delegate');
    require(msg.value > 0, 'Amount needed to delegate');
    approve[owner][sp1] += msg.value;
    delegate.push(sp1);
   }

//    function getdelegate() public view returns(uint256) {
//        return approve;
//    }

}
