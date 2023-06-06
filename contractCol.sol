//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract contractOne {
    mapping(address => uint256) public addressBalance;

    function deposite() public payable {
        addressBalance[msg.sender] = msg.value;
    }

    receive() external payable {
        deposite();
    }
}

contract contractTwo {
    // it can receive eth
    receive() external payable {}

    function depositeOnContractOne(address _contractOne) public {
        // contractOne one = contractOne(_contractOne);

        // give value to, ContractOne, here call the deposite funcitons
        // one.deposite{value: 10, gas: 100000}();
        // we are sending 10 wei transfer  deposite function
        // native way to transfer eth to another contract

        // if dont know the contract than how we can send ??
        // by ecode Signature
        // bytes memory payload = abi.encodeWithSignature("deposite()");
        // (bool success, ) = _contractOne.call{value: 10, gas: 100000}(payload);
        // it return 2 things 
        // require(success);

        // if actually dont know about deposite function than ?
        // than receiver contract must have the receiver function
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(success);
    }
}
