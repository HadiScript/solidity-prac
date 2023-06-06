//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract addressExamples {
    address public someAddress; // default zero address

    //  0x0000000000000000000000000000000000000000

    // function setSomeAddress(address _someAddress) public {
    //     someAddress = _someAddress;
    // }

    function setSomeAddress() public {
        someAddress = msg.sender;
    }

    // getting balance of the specific balance
    function getAddressBalance() public view returns (uint256) {
        return someAddress.balance;
    }
}

// As you continue, please pay special attention to the following few concepts here which are really important and different than in any other programming language:

// The Smart Contract is stored under its own address
// The Smart Contract can store an address in the variable "someAddress", which can be its own address, but can be any other address as well.
// All information on the blochain is public, so we can retrieve the balance of the address stored in the variable "someAddress"
// The Smart Contract can transfer funds from his own address to another address. But it cannot transfer the funds from another address.
// Transferring Ether is fundamentally different than transferring ERC20 Tokens or NFTs, as you will see later.
// Before you continue, read the statements above and keep them in mind. These are the most mind-blowing facts for Ethereum newcomers.

// 1wei == 10^18
