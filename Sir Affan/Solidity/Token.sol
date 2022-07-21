
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract delegatemultiple {

    string message;
    address public owner;
    address[] public delegate;

    constructor(string memory msgg) {
       message = msgg;
        owner = msg.sender;
    } 

    // nested mapping for delegating account value of token
 mapping (address => mapping (address => uint256)) internal approve;
   
   
   // delegate function to assign address and allocate funds
   function makedelegate(address sp1) public payable{
    require (msg.sender == owner, 'Only Owner Right to assign delegate');
    require(msg.value > 0, 'Amount needed to delegate');
    approve[owner][sp1] += msg.value;
    delegate.push(sp1);
   }

    //call nested mapping variable by passing params
   function getdelegate(address deployerr, address spnder) public view returns(uint256) {
       return approve[deployerr][spnder];
       }
}
