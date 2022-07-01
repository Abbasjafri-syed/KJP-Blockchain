// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

library uintArrays {
    function arrayLen(uint[] storage array) internal view returns (uint) {
        return array.length;
    }

    function arrayFirstElement(uint[] storage array) internal view returns (uint) {
        return array[0];
    }
}


contract Test {

    using uintArrays for uint[];
    uint[] data;
    constructor()  {
      data.push(1);
      data.push(2);
      data.push(3);
      data.push(4);
      data.push(5);
   }
    function arrayLength() external view returns(uint) {
        uint arrayLen =  data.arrayLen();
        return arrayLen;
    }

    function arrayFirstMember() external view returns(uint) {
        uint first =  data.arrayFirstElement();
        return first;
    }

}
