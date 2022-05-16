// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SendMoneyExample {

    uint public balanceRecieved;

    function receiveMoney() public payable {
        balanceRecieved += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawMoney() public {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }

    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(getBalance());
    }

}
