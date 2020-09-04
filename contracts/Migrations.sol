pragma solidity ^0.5.16;

contract Migrations { //“push” the smart contracts to the Ethereum blockchain
  address public owner; //set up necessary steps for linking contracts with other 
                      //contracts as well as populate contracts with initial data
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() public {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}
