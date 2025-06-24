// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {OptimizedERC20} from "./OptimizedERC20.sol";

contract GoldToken is OptimizedERC20 {
    address public owner;

    constructor() OptimizedERC20("GoldToken", "GLD") {
        owner = msg.sender;
    }

    function mint(address account, uint256 amount) external {
        require(msg.sender == owner, "only owner can call this");
        _mint(account, amount);
    }
}
