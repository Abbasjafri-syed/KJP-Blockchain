// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

    //importing contract by defining path and saving with another name as datatype
import {storeapp as contrct}  from "./storeapplication.sol";

      //inheritance
// contract nestedcontrct is storeapplication { //inherit all functions in the contract}
contract nestedcontrct{
        //making array for imported contract with defining name for variable
        contrct[] public dplyarr;

        //deploying the contract which will deploy the imported contract and pushing it into array for making index
    function cntrctfctry()public{
        contrct dply= new contrct();
        dplyarr.push(dply);
    }
        //calling a function from a contract by its index number in which it is pushed to set a value
    function setfunc(uint256 indx, uint256 val)public{
        contrct dply= contrct(address(dplyarr[indx]));
        dply.setval(val);
        //same as above
        // contrct(address(dplyarr[indx])).setval(val);
    }

    //calling a function from a contract by its index number in which it is pushed to get the value
    function getfunc(uint256 indx)public view returns (uint256){
        contrct dply= contrct(address(dplyarr[indx]));
        return dply.getval();
        //same as above
        // contrct(address(dplyarr[indx])).getval();
    }
}
