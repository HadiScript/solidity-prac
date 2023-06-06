//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract UnitSample {
    // 1000000000000000000 = 1e18 = 1 ether
    modifier betweenOneAndTwoEth() {
        require(msg.value >= 1 ether && msg.value <= 2 ether);
        _;
    }

    uint256 runUntillTimestamp;
    uint256 startTimestamp;

    constructor(uint256 StartInDays) {
        startTimestamp = block.timestamp + (StartInDays * 1 days);
        runUntillTimestamp = startTimestamp + (7 days);
    }

    // seconds
    // minutes
    // hours
    // days week
}
