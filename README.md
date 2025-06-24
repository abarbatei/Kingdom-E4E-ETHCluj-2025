# Kingdom-E4E-ETHCluj-2025

## Setup

Setup should be already done default, just clone the repo with submodules:

```
git clone --recurse-submodules git@github.com:abarbatei/Kingdom-E4E-ETHCluj-2025.git
```

If for-whatever reason, the OpenZeppelin library is not found, you can re-add it as:

```sh
forge install OpenZeppelin/openzeppelin-contracts --no-commit
```

Running the task (with a minimum of 2 `v`s, for verbosity, can be 3):

```sh
forge test -vv
```

Requires Solidity compiler for `0.8.20` minimum, `forge` should install the requirement automatically when running the test.

# Description

In a far far away land, governance has chosen to reward its most loyal subjects. The Treasury contract was deployed and gold coins were added for each subject to claim. 

An angry subject, which was omitted from the reward list, has become an attacker and wants to steal as many coins as possible.

# Task

In the `Kingdom.t.sol::stealGoldCoins` function, implement what is necessary for the attacker to have at the end of the function call 56 full gold coins.

_You cannot use any vm cheat codes._

Note: running the test without finish the task successfully will result in an error similar to this:

```
Ran 1 test for test/Kingdom.t.sol:Playground
[FAIL. Reason: attacker must have 56 full cold coins at the end: 0 != 56000000000000000000] test_fairKingdomDistribution() (gas: 221515)
Logs:
  Hacker gonna hack!
```

When the test passes, you know you completed the task.

# Context

*Part of a [security workshop](https://github.com/ethcluj/Ethereum-for-Everyone-ETHCluj-2025-Book/blob/main/en/08-security-audits.md) of the Ethereum for Everyone 2025 book, a public good created to help Web2 users begin their journey into Web3. The book brings together a series of practical workshops presented at the EthCluj conference, aiming to make blockchain, Ethereum, and decentralized technologies more accessible to a wider audience.*
