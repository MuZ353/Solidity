// SPDX-License-Identifier: MIT
// http://home.mit.bme.hu/~ikocsis/BC2019HF/sol/solidity_08.html

pragma solidity ^0.8.3;

import "hardhat/console.sol";

contract BmeHf3 {
    uint public dailyPrice;
    address public owner;

    mapping(address => uint) public myMembers;

    constructor(uint _dailyPrice) {
        dailyPrice = _dailyPrice;
        owner = msg.sender;
    }

    function Withdraw() public {
        require(msg.sender == owner,"egy guano");
        address payable to = payable(msg.sender);
        to.transfer(address(this).balance);
    }

    function BuyMembership() public payable {
        uint membershipUntil = myMembers[msg.sender];
        uint incMembership = msg.value / 1e18 / dailyPrice;

        if(membershipUntil < block.timestamp) {
            membershipUntil = block.timestamp + incMembership * 30 seconds;
        }
        else {
            membershipUntil = membershipUntil + incMembership * 30 seconds;
        }

        myMembers[msg.sender] = membershipUntil;
        console.log("Gyurmatime: ");
        console.log(membershipUntil - block.timestamp," mp");
    }

    function validate(address client) public view returns (bool) {
        return (myMembers[client] > block.timestamp);
    }

    function validateUntil(address client) public view returns (uint) {
        console.log(myMembers[client] - block.timestamp);
        return (myMembers[client] - block.timestamp);
    }
}   
