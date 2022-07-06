// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import {AggregatorV3Interface as PriceFeed} from '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';

contract funding{
        //saving value against address using mapping
    mapping(address => uint256) public walletamount;

    // sending amount into contract and saving address as sender and also amount sent
    function funded() public payable{
        walletamount[msg.sender] += msg.value;
        }
        //checking balance of contract
    function fundd() public view returns (uint256){
        uint256 balnce = address(this).balance;
        return balnce;
        }
        //live price feeds from oracle
    function Price() public view returns (uint256){
        PriceFeed tknprice = PriceFeed(0x9326BFA02ADD2366b30bacB125260Af641031331);
       (,int256 answer, , ,) = tknprice.latestRoundData();       
        return uint256(answer);
        }

}



// {   }
//  ( )
