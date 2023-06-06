// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    address public minter;
    mapping(address => uint256) public balances;

    event Sent(address from, address to, uint256 amount);

    constructor() {
        minter = msg.sender;
    }

    // make new coin and send them to address
    // only owner can send these coin
    // minter can send amount to reciver with his address
    function mint(address receiver, uint256 amount) public {
        require(msg.sender == minter);
        // balances[reciever] = balances[receiver] + amount;
        balances[receiver] += amount;
    }

    // if balance is not enough then revert direct to this error
    error notEnoughBalance(uint256 requested, uint256 available);

    // send amount to existing address
    // man who is in the balance mapping, can send amount to anyone
    function send(address receiver, uint256 amount) public {
        // sender have enough coins ??
        // require(balances[msg.sender] > amount); can be useed

        if (amount > balances[msg.sender])
            revert notEnoughBalance({
                requested: amount,
                available: balances[msg.sender]
            });

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
