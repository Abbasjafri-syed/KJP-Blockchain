// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

// Determining address either as a Smart contract or EOA[Individual] i.e., MetaMask, Trustwallet etc.
contract AccountCheck {
    function checkAddress(address _addr) public view returns (string memory) {
        uint256 length;
        assembly {
            length := extcodesize(_addr)
        }
        if (length > 0) {
            return "Contract Account";
        }
        return "EOA Account";
    }
}
