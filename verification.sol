//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract sampleVerification {
    mapping(address => uint256) public balance;

    constructor() {
        balance[msg.sender] = 100;
    }

    function transfer(address to, uint256 amount) public {
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }

    function someCrypticFunctionaNmae(address _addr)
        public
        view
        returns (uint256)
    {
        return balance[_addr];
    }
}
