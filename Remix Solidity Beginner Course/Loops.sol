// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Loop {
    uint count;
    uint _i;
    uint _j;

    function loop() public {
        // for loop
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
            count ++;
            _i = i;
        }

        // while loop
        uint j;
        while (j < 10) {
            j++;
        }
        _j = j;

    }

    function get() public view returns (uint C, uint I, uint J) {
        return (count, _i, _j);
    }
}
