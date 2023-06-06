//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

//  from the sender we are sending eth to other contract with low level transection button
contract Sender {
    receive() external payable {}

    // when send to RecAction (who store value)
    // transfer will give us the error
    function withdrawTransfer(address payable _to) public {
        _to.transfer(10);
    }

    // send will not give us the error
    // it give us the bool value
    function withdrawSend(address payable _to) public {
        bool isSent = _to.send(10);

        require(isSent, "message");
        //  send withh give us the error
    }
}

// just read, its contract balance
contract ReceiverNoAction {
    function balance() public view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {}
}

// just read, its contract balance
// and saving in states
contract ReceiverAction {
    uint256 public balanceReceived;

    function balance() public view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {
        balanceReceived += msg.value;
    }
}
