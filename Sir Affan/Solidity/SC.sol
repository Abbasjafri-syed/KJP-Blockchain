// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract contrct1st{
    //global variable
    string message;
    uint256 _batch;
    address _wallet;
        //params for deploy contract
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
     //changing contract address
  function setadress(address account) public {
      _wallet = account;
    }
function getname() public view returns(string memory) {
     return message;
        }

  function getnum() public view returns(uint256) {
     return _batch;
    }
   
  function getadress() public view returns(address) {
      return _wallet;
    }
        //transfer ownership of contract
     function trnsfrcontract(address account) public payable {
       require(_wallet == msg.sender, 'Owner right to transfer adress');
       require(msg.value == 100, 'amount required todo transer');
       _wallet = account;
      }
      
      //withdraw funds from contract
    function withdrawfunds() public payable returns(uint256){
       require(_wallet == msg.sender, 'Owner right to withdrawfunds from contrct');
       uint256 adressbal= address(this).balance;
       payable(_wallet).transfer(adressbal);
       return adressbal;
      }
      
      //defining recipient address of wallet to tranfer funds in contract 
    function recipient(uint256 amount, address recvr) public payable {
      uint256 adressbal = address(this).balance;
     require(amount < adressbal, 'amount should be less than contrct balnce');
      payable(recvr).transfer(amount);
      }
     }
