//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract MappingExamples {
    mapping(uint256 => bool) public myMaps;
    mapping(address => bool) public myMaps2;
    mapping(uint256 => mapping(uint256 => bool)) public mapsOfmaps;

    function setValues(uint256 index) public {
        myMaps[index] = true;
    }

    function setMyAddress() public {
        myMaps2[msg.sender] = true;
    }

    function getMyMap2() public view returns (bool) {
        return myMaps2[msg.sender];
    }

    function setMapsOfMaps(uint256 key1, uint256 key2, bool value) public {
        mapsOfmaps[key1][key2] = value;
    }
}
