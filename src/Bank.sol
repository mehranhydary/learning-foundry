// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

/**
  This contract lets a user deposit ETH
  - This contract will keep track of how much ETH is deposited for each user
  - This contract will allow user to withdraw when they want their ETH back
  - This contract also has a fucntion to get the balance of ETH
 */

contract Bank {

  mapping(address => uint) public balances;


  function deposit() public payable {
    balances[msg.sender] += msg.value;
  }

  function withdraw(uint _amount) public {
    require(balances[msg.sender] >= _amount);
    (bool sent, ) = msg.sender.call{value: _amount}("");
    require(sent, "Failed to send Ether");
    balances[msg.sender] -= _amount;
  }



  function getBalance() public view returns (uint) {
    return address(this).balance;
  }
}
