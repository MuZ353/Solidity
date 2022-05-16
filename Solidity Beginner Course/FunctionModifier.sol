
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract FunctionModifier{
    uint public count;
    bool public paused;

    function setPause(bool _paused) external {
    paused = _paused;
    }

    function inc() public {
        require(!paused, "paused");
        count +=1;
    }

    function dec() public {
        require(!paused, "paused");
        count -=1;
    }

}   
