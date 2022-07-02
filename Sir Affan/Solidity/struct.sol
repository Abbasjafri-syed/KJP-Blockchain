// SPDX-License-Identifier: None
pragma solidity ^0.8.12;

contract storeapp {
    
    uint256 num;

    struct variet { 
        string naam;
        uint256 val;
    }
    
    //passing value in struct through params
    variet public varing;
     
     function setvar(string memory naem, uint256 valk) public {
      varing = variet(naem, valk);
       }
   function getvar() public view returns (variet memory) {
      return varing;
   }


    //passing array in struct
   variet[] public varet;
   
   function addarray(string memory naem, uint256 valk) public {
      varet.push(variet({naam : naem, val :valk}));
         }


    //storing string with integer value through mapping
   mapping(string => uint256) public varl;
   function mapvar(string memory naem, uint256 valk) public {
      varl[naem]= valk;
   }
}
