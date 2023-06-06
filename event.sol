//SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract EventExample {
    mapping(address => uint256) public tokenBalance;

    event tokensSent(address _from, address _to, uint256 _amount);

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint256 _amount) public returns (bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        // creating logs
        // we can put it into above require
        // emit just save logs when transection is successfull only
        emit tokensSent(msg.sender, _to, _amount);

        return true;
    }
}
