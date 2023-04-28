# Debugging with Hardhat Network

Hardhat comes built-in with Hardhat Network, a local Ethereum network designed for development. It allows you to deploy your contracts, run your tests and debug your code, all within the confines of your local machine. It's the default network that Hardhat connects to, so you don't need to set up anything for it to work. Just run your tests.

# Solidity `console.log`

When running your contracts and tests on Hardhat Network you can print logging messages and contract variables calling `console.log()` from your Solidity code. To use it you have to import `hardhat/console.sol` in your contract code.

This is what it looks like:

```script
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract Token {
  //...
}
```

Then you can just add some `console.log` calls to the `transfer()` function as if you were using it in JavaScript:

```javascript
function transfer(address to, uint256 amount) external {
    require(balances[msg.sender] >= amount, "Not enough tokens");

    console.log(
        "Transferring from %s to %s %s tokens",
        msg.sender,
        to,
        amount
    );

    balances[msg.sender] -= amount;
    balances[to] += amount;

    emit Transfer(msg.sender, to, amount);
}
```