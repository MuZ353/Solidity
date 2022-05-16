// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
// remix.com 5.2 példafeladat

contract ViewAndPure {
    uint public x = 1;

    // Promise not to modify the state.
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // Promise not to modify or read from the state.
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }

    // takes the parameter y and updates the state variable x with the sum of the parameter and the state variable x
    function addToX2(uint y) public {
        x = x + y;
    }
}
