// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract BmeHf3 {
  uint public receivedBalance;
  uint public maxAmount0 = 0;
  uint public maxAmount1 = 0;

  address[2] public owners;

  constructor() payable {
    owners[0] = 0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7;
    owners[1] = 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C;
  }

  modifier onlyOwnerS() {
      require(msg.sender == owners[0] || msg.sender == owners[1], "Nem a te peeeztarcad");
      _;
  }

  modifier maxEther(uint _amount) {
    uint maxAmount;

    if (msg.sender == owners[0]) {
      maxAmount = maxAmount0;
    }
    else if (msg.sender == owners[1]) {
      maxAmount = maxAmount1;
    }

    if(maxAmount == 0) {
      maxAmount = 1;
    }

      require(_amount <= maxAmount,"Max Ether");
      _;
  }

  modifier onlyOne() {
    require((maxAmount0 == 0) && (maxAmount1 == 0));
    _;
  }

  function ReceiveMoney() public payable {
    receivedBalance += msg.value;
  }

  function GetBalance() public view returns(uint) {
      return address(this).balance;
  }

    function GiveMeMoney(uint _amount) public onlyOwnerS maxEther(_amount){
      address payable to = payable(msg.sender);
      to.transfer(_amount * 1e18);
      maxAmount0 = 0;
      maxAmount1 = 0;
  }

  // mié van ez?

  function GetOwners() public view returns(address[2] memory) {
        return owners;
    }

  function Sign(uint _maxAmount) public onlyOwnerS onlyOne{
    if (msg.sender == owners[0]) {
      maxAmount1 = _maxAmount;
    }
    else if (msg.sender == owners[1]) {
      maxAmount0 = _maxAmount;
    }
  }
}
