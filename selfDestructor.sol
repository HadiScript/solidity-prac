//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract selfDistruct {
    receive() external payable {}

    //  when i press button destroySmartContract
    // for the first time
    // it send money
    // but for the second it dont send money becouse
    // virtually this contract has been destroyed
    function destroySmartContract() public {
        // it will send money to address
        // no matter if it have recevice and fallback functions
        selfdestruct(payable(msg.sender));
    }
}
