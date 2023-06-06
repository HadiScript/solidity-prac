//SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

contract ExceptionExample {
    mapping(address => uint8) public balanceReceived;

    function receiveMoney() public payable {
        // campare
        assert(uint8(msg.value) == msg.value);
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    // without assert
    // if we put in 257 wei in reciceMoney
    // it give only 1 wei

    function withdrawMoney(address payable _to, uint8 _amount) public {
        require(
            _amount <= balanceReceived[msg.sender],
            "Not Enough Funds, aborting"
        );

        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
