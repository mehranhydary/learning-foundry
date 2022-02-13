// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Bank.sol";

contract BankTest is DSTest {
    // Creating a Bank variable to store Bank smart contract
    Bank myBank;

    function setUp() public {
        // Initializing the Bank smart contract here and storing
        myBank = new Bank();
    }

    function testOneEtherDeposit() public {
        // Depositing eth into the contract
        myBank.deposit{value: 1 ether}();
        // Checking if the contract gets the ETH
        assertEq(1 ether, myBank.getBalance());
    }
    
    // Fuzzing the deposit function 
    //   (using mod because uint256 might be too big)
    function testDeposit(uint x) public {
        // Depositing eth into the contract
        myBank.deposit{value: x % 5}();
        // Checking if the contract gets the ETH
        assertEq(x % 5, myBank.getBalance());
    }

    // failing : T_T

    function testOneEtherWithdraw() public {
        // Should be the same account
        myBank.deposit{value: 0.5 ether}();
        myBank.withdraw(0.5 ether);
        
        assertEq(0, myBank.getBalance());
    }
}
