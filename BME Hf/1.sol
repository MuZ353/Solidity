// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract BmeHf1 {
    uint public receivedBalance;
    uint public lockedUntil;

    address[2] public owners;
    address public hier;

    constructor() payable {
        owners[0] = msg.sender;
        lockedUntil = block.timestamp + 1 minutes;
    }

    modifier onlyOwner() {
        require(msg.sender == owners[0], "Nem te mondod meg");
        _;
    }

    modifier onlyOwnerS() {
        require(msg.sender == owners[0] || msg.sender == owners[1], "Nem a te peeeztarcad");
        _;
    }

    modifier isHier() {
        require(msg.sender == hier, "Nem Hier, haha");
        _;
    }




    function WealthManager(address partner, address _hier) public onlyOwner {
        owners[1] = partner;
        hier = _hier;
    }

    //******

    function Receive () public payable {
        receivedBalance += msg.value;
    }

    function GetBalance() public view returns(uint) {
        return address(this).balance;
    }

    function HierWithrdraw () public isHier {
        require(lockedUntil < block.timestamp, "Vaaarjaa meg he");

        address payable to = payable(msg.sender);
        to.transfer(GetBalance());
        //selfdstruct

    }

    /*function WithdrawMoneyTo(address payable _to) public onlyOwner{
        _to.transfer(GetBalance());
    }*/

    function GiveMeMoney(uint _amount) public onlyOwnerS {
        address payable to = payable(msg.sender);
        to.transfer(_amount * 1e18);

        lockedUntil = block.timestamp + 1 minutes;
    }

    function GetOwners() public view returns (address[2] memory) {
        return owners;
    }

    function RemainingTime() public view returns(uint) {
        return(lockedUntil - block.timestamp);
    }

}
