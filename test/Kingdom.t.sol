// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Treasury} from "../src/Treasury.sol";
import {GoldToken} from "src/GoldToken.sol";


contract Playground is Test {
    address governance = makeAddr("governance");
    address winner1 = makeAddr("Hero of NothingGale");
    address winner2 = makeAddr("Slayer of Words");
    address winner3 = makeAddr("Hard working peasant");
    address winner4 = makeAddr("Not that hard working peasant but a good lad");
    address winner5 = makeAddr("City guard");
    address attacker = makeAddr("attacker");

    Treasury treasury;

    function setUp() public {
      vm.startPrank(governance);
      treasury = new Treasury();
      treasury.setWinner(winner1, 13 ether);
      treasury.setWinner(winner2, 12 ether);
      treasury.setWinner(winner3, 11 ether);
      treasury.setWinner(winner4, 10 ether);
      treasury.setWinner(winner5, 10 ether);
      vm.stopPrank();
    }

    function test_fairKingdomDistribution() public {
        GoldToken gold = treasury.goldCoins();

        vm.prank(winner1);
        treasury.claimWinnings();
        assertGt(gold.balanceOf(winner1), 0);

        vm.prank(winner2);
        treasury.claimWinnings();
        assertGt(gold.balanceOf(winner2), 0);

        vm.prank(winner3);
        treasury.claimWinnings();
        assertGt(gold.balanceOf(winner3), 0);

        vm.prank(winner4);
        treasury.claimWinnings();
        assertGt(gold.balanceOf(winner4), 0);

        vm.prank(winner5);
        treasury.claimWinnings();
        assertGt(gold.balanceOf(winner5), 0);
        
        vm.startPrank(attacker);
        stealGoldCoins();
        vm.stopPrank();

        assertEq(gold.balanceOf(attacker), 56 ether, "attacker must have 56 full cold coins at the end");
    }

    function stealGoldCoins() private {
      console.log("Hacker gonna hack!");
      // add code here
    }
}
