// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import {AggregatorV3Interface as PriceFeed} from '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';

contract funding{
    address public owner;
    address[] public funders;


    constructor() { //making deployer address default owner of contract
    owner = msg.sender;
        }

        //live price feeds from oracle
    function Price() public view returns (uint256){
        PriceFeed tknprice = PriceFeed(0x9ef1B8c0E4F7dc8bF5719Ea496883DC6401d5b2e);
       (,int256 answer, , ,) = tknprice.latestRoundData();       
        return uint256(answer /1e8);
        }

        //converting wei into required currency
    function convertPrice(uint256 ethamount) public view returns (uint256){
        uint256 ethprice = Price();
        uint256 ethusd = (ethprice * ethamount) / 1 ether;    
        return ethusd;
        }

        //saving value against address using mapping
    mapping(address => uint256) public walletamount;

    // sending amount into contract and saving address of sender with amount sent
    function funded() public payable{
        uint256 reqamount = 500;
        require(convertPrice(msg.value) >= reqamount, 'Amount does not meet threshold');
        walletamount[msg.sender] += msg.value;
        funders.push(msg.sender);
        }

   //modifiers are like middleware which provide condition 
   modifier Onlyowner{
        require(msg.sender == owner, 'Only owner Rights');
        _;
        }

        // tranferring contract ownership
    function trnsferownr(address newownr) payable Onlyowner public {
        require(msg.value >= 20000, 'Amount needed to transfer ownership');
        owner = newownr;
        walletamount[msg.sender] += msg.value;
        funders.push(msg.sender);
        }

        //checking balance of contract
    function fundd() public view returns (uint256){
        uint256 balnce = address(this).balance;
        return balnce;
        }

       // withdrawing funds from contract with owner rights 
    function withdarwfunds() payable Onlyowner public {
        uint256 cntrctbal = address(this).balance;
        payable(owner).transfer(cntrctbal);

        //loop for resetting senders amount to zero after withdrawal
        for(uint256 i = 0; i < funders.length; i++){
        address funds = funders[i];
        walletamount[funds] = 0;
        }
        funders = new address[](0); // emptying funders array after withdrawing funds

        }

}
