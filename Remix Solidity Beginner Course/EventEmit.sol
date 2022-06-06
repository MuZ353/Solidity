// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract testEmitLog {
    event Log(address sender, uint amount, uint x);

    function test(uint amount) external {
        uint x = 123;

        emit Log(msg.sender, amount, x);
    }
}
