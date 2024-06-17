// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    address public owner;
    uint256 public value;

    constructor() {
        owner = msg.sender;
        value = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function setValue(uint256 newValue) public onlyOwner {
        // Using require() to check input validity
        require(newValue > 0, "Value must be greater than zero");

        value = newValue;

        // Using assert() to ensure the internal state is correctly updated
        assert(value == newValue);
    }

    function resetValue() public onlyOwner {
        value = 0;

        // Using assert() to ensure the internal state is correctly reset
        assert(value == 0);
    }

    function dangerousFunction() public pure {
        // Using revert() to deliberately revert the transaction
        revert("This function always reverts");
    }
}
