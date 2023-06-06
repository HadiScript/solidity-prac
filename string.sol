//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

// strings are expensive to store in blockchain
contract Strings {
    string public myString = "hello word"; //ut8-f representation
    bytes public myBytes = "Hello World"; // same as string but //ut8-f not representation

    // "ö" if we use the latin charactor like this
    //      its a 2 bytes now "hello wörld" have the 12 lenght

    // but they have length and can convert becouse it gives bytes not string

    function setString(string memory _string) public {
        myString = _string;
    }

    function campareString(string memory _mystring) public view returns (bool) {
        // return myString == _mystring;
        // this is not compatible we can not campare like this of 2 strings

        //  now its camparing the hashed
        return
            keccak256(abi.encodePacked(myString)) ==
            keccak256(abi.encodePacked(_mystring));
    }

    function getBytesLength() public view returns (uint256) {
        return myBytes.length;
    }
}

// There are no native string comparison functions in Solidity. There is still a way to compare two strings: by comparing their keccak256 hashes.

// Strings are actually arbitrary long bytes in UTF-8 representation. Strings do not have a length property, bytes do have that. Let's run an example and add a bytes variable with the same "Hello World". Extend the contract with the yellow part:
