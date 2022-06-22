// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract contrct1st{

    string message;
    uint256 _batch;
    address _wallet;

    constructor(string memory _name){
            message = _name;
            _wallet = msg.sender;
      }

  function setname(string memory newname) public  {
      message = newname;
    }

  function setnum(uint256 year) public {
      _batch = year;
    }

  function setadress(address account) public {
      _wallet = account;
    }
  function accountblnce(string memory account) public {
    require(account = msg.sender);
    _wallet = account;
    }

  function recipiet(address account) public {
    require( );
    uint256 balance = address(this).balance;
    _wallet = account;
    }
    
}
