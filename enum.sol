// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract State {
    // create enum
    enum user {
        allow,
        notAllowed,
        wait
    }

    // create user variable as u1 and set
    // value in allow
    // allow->0 notAllowed->1, wait->2
    user public u1 = user.allow;

    uint256 public lottery = 1000;

    function owner() public {
        if (u1 == user.allow) {
            lottery = 0;
        }
    }
}
