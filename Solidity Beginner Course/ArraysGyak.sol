// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Array {
    uint[] public nums = [1, 2, 3];
    uint[3] public numsFixed = [4, 5, 6];
    uint public length;

    function examples () external {
        nums.push(4); // [1, 2, 3, 4]
        uint x = nums[1]; // 2
        nums[2] = 777; // [1, 2, 777, 4]
        delete nums[1]; // 1, 0, 777, 4]
        nums.pop(); // 1, 0, 777
        uint len = nums.length;
        length = len;

        //create array in memory
        uint[] memory a = new uint[](5);
        // fix hossz miatt nem compile
        //a.pop;
        //a.push;
    }


    function returnArray() external view returns (uint[] memory){
            return nums;
    }

}
