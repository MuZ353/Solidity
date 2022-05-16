// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract BmeHf3 {
  uint public receivedBalance ;
  address[2] public owners;

  constructor() {
    owners[0] = 0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7;
    owners[1] = 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C;
  }

  modifier onlyOwnerS() {
      require(msg.sender == owners[0] || msg.sender == owners[1], "Nem a te peeeztarcad");
      _;
  }

  modifier maxOneEther(uint _amount) {
      require(_amount <= 1,"Max 1 Ether");
      _;
  }

  function ReceiveMoney() public payable {
    receivedBalance += msg.value;
  }

  function GetBalance() public view returns(uint) {
      return address(this).balance;
  }

    function GiveMeMoney(uint _amount) public onlyOwnerS maxOneEther(_amount){
      address payable to = payable(msg.sender);
      to.transfer(_amount * 1e18);
  }

  // mié van ez?

  function GetOwners() public view returns(address[2] memory) {
        return owners;
    }




}
