//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract TheBlockchainMessenger {
    string public mystring;

    // function UpdateString(string memory _string) public {
    //     mystring = _string;
    // }

    // now this function able to transections
    function UpdateString(string memory _string) public payable {
        // for change the string must have 1 eth else send back him that value
        // can

        // if else does not throw any error but require can give
        // require(msg.value == 1 ether);
        if (msg.value == 1 ether) {
            mystring = _string;
        } else {
            // transfer and send available to type address payable
            // msg.sender.transfer(msg.value);
            payable(msg.sender).transfer(msg.value);
        }
    }
}
