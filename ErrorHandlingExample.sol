// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingExample {
    address public owner;
    uint256 public value;

    constructor() {
        owner = msg.sender;
        value = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function setValue(uint256 _newValue) external onlyOwner {
        // Using require statement
        require(_newValue > value, "New value must be greater than the current value");

        // Using assert statement
        assert(_newValue < 1000);

        // Using revert statement
        if (_newValue > 100) {
            revert("Value cannot exceed 100");
        }

        value = _newValue;
    }

    function getValue() external view returns (uint256) {
        return value;
    }
}
