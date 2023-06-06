//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleViewPure {
    uint256 public myStorageVariable;

    // view can access the myStorageVariable just read
    function setMyStorageVariable() public view returns (uint256) {
        return myStorageVariable;
    }

    // pure can not access the storage variable like myStorageVariable
    function getAddition(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // return is not usally for write 
    // in this we can not see return anythings
    function setMyStorageVariable(uint256 _newVar) public returns (uint256) {
        myStorageVariable = _newVar;
        return _newVar;
    }
}
