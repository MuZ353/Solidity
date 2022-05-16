// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract FunctionModifier{
    uint public count;
    bool public paused;

    function setPause(bool _paused) external {
    paused = _paused;
    }

    modifier whenNotPaused(){
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotPaused {
        count +=1;
    }

    function dec() external whenNotPaused {
        count -=1;
    }

    modifier cap(uint _x) {
        require(_x < 100, "x >= 100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    modifier sandwitch(){
        //code here
        count += 10;
        _;
        count *= 2;
        //more code here
    }

    function foo() external sandwitch {
        count += 1;
    }
}   
