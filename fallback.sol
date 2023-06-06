//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract sampleFallback {
    uint256 public lastValueSent;
    string public lastFunctionCall;
    uint256 public myUint;

    function setMyUint(uint256 newUint) public {
        myUint = newUint;
    }

    // in the remix
    // we can get  raw or hash of setMyUint
    // ** first four bits in hash and raw is the same
    // ** 0xa03f same
    // by: web3.utils.sha3("setMyUint(uint256)")
    // it will give the: 0xa03f204aa4a46406b8e58c5e9d3cde0d670c2e54ade721195cca9d12e314422e
    // we can give this hash to transection button it will call this itself

    // setMyUint has the hash -> from this, it should call
    // if you dont press the remix setMyUint button but just write the
    // its raw data in the transection field it called it self setMyUint function

    // it can onky rely 2300 gas fee
    // receive() external payable {
    //     lastValueSent = msg.value;
    //     lastFunctionCall = "rcevied";
    // }

    // if there is not call data
    // they will not give problem but if you have the call data
    // you must have the fallback function

    // in this payable is optional
    // if you want ot get value then payable
    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCall = "fallbak";
    }

    // if you have fallback function with the payable
    // and receive function is not there than it not give the any error
}
