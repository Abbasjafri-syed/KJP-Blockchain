// SPDX-License-Identifier: None

pragma solidity ^0.8.12;

contract makecntrct{
    string public name; //public make appears call button -by deafult it is internal
    uint256 public amount;
    address public wallet;

    //optional required to deploy contract
    constructor(string memory _name){
        name = _name;
        wallet = msg.sender;
}

    //setting value into integer variable-global
    function setval(uint256 valk)public {
        amount = valk;
}

    //setting value into  string variable-global
    function setname(string memory naam)public {
        name = naam;
}
    //setting owner into  address variable-global
    function setownr(address peck)public payable{
        require(msg.value == 12, 'amount require to add wallet');
        require(wallet == msg.sender, 'owner required to do transcation');
        wallet = peck;
        }

       //cal function to view contract balance 
    function getbal()public view returns(uint256) {
        uint256 bal= address(this).balance; //method to know contract balance
        return bal;
        }

        //withdraw balance in contract to a wallet
    function withdraw(uint256 amt, address recvr)public payable {
        uint256 bal= address(this).balance;
        require(amt == bal, 'withdrawing total amounts');
        payable(recvr).transfer(amt);
        }

    struct datastore { //struct is a customised datatype
        string naam;
        uint256 val;
        address wallet;
    }

    datastore public base; //make variable of datatype with defining it type and visibility

        //setting value in struct through params
    function setdata(string memory naeme,uint256 nmbr, address recvr)public {
        base = datastore(naeme, nmbr, recvr);
        }
    //calling the values set in the struct
    function getdata()public view returns(datastore memory){
        return base; 
        }
        
    datastore[] public basearr; //make  variable of array datatype in struct with defining it type and visibility
            
        //setting value in array struct through params
    function setarr(string memory naem,uint256 nmb, address recv)public {
        basearr.push(datastore(naem, nmb, recv));
        }

        //callling value of arraay struct
    function getarr()public view returns(datastore[] memory){
        return basearr; 
        }

    //mapping-function to store a datatype with other type as a key[as an array] value pair
        mapping(address => string) public wall;

        //saving address as string through mapping
    function setaddrsname(address blnc, string memory nami) public {
        wall[blnc] = nami; 
        }

        //calling mapping value as aved in other data type
    function getaddrsname(address blnc)public view returns(string memory){
        return (wall[blnc]); 
        }
   }
