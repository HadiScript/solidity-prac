//SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract Example {
    struct Transections {
        uint256 amount;
        uint256 timestamp;
    }

    struct balanceRec {
        uint256 totalBalance;
        uint256 numberOfdeposite;
        mapping(uint256 => Transections) deposites;
        uint256 numberWithdraw;
        mapping(uint256 => Transections) withdraws;
    }

    // we can also get the deposites and withdraws

    mapping(address => balanceRec) public balances;

    function despositeMoney() public payable {
        balances[msg.sender].totalBalance += msg.value;

        Transections memory transection;
        transection.amount = msg.value;
        transection.timestamp = block.timestamp;

        balances[msg.sender].deposites[
            balances[msg.sender].numberOfdeposite
        ] = transection;
        balances[msg.sender].numberOfdeposite++;
    }

    function withDrawMoney(address payable _to, uint256 _amount) public {
        balances[msg.sender].totalBalance -= _amount;

        Transections memory withdrawTransections;
        withdrawTransections.amount = _amount;
        withdrawTransections.timestamp = block.timestamp;

        balances[msg.sender].withdraws[
            balances[msg.sender].numberOfdeposite
        ] = withdrawTransections;

        balances[msg.sender].numberOfdeposite++;

        _to.transfer(_amount);
    }
}
