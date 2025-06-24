// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {GoldToken} from "src/GoldToken.sol";

contract Treasury {
    
    event Claimed(string message);
    
    address public owner;
    GoldToken public goldCoins;
    mapping (address user => uint amount) winners;

    constructor() {
        owner = msg.sender;
        goldCoins = new GoldToken();
    }

    function setWinner(address user, uint256 amount) external {
        require(owner == msg.sender, "caller is not owner");
        require(user != address(0), "user must exist");
        winners[user] = amount;
    }

    function claimWinnings() external {
        uint256 amountToClaim = winners[msg.sender];
        require(amountToClaim > 0, "user has no winnings");
        goldCoins.mint(msg.sender, amountToClaim);
        emit Claimed(string(abi.encodePacked(msg.sender, " has claimed ", amountToClaim, " cash, like a champ!")));
    }
}
