# Testing contracts

Writing automated tests when building smart contracts is of crucial importance, as your user's money is what's at stake.

To test our contract, we are going to use Hardhat Network, a local Ethereum network designed for development. It comes built-in with Hardhat, and it's used as the default network. You don't need to setup anything to use it.

In our tests we're going to use [ethers.js](https://docs.ethers.io/v5/) to interact with the Ethereum token contract we built in the step04, and we'll use [Mocha](https://mochajs.org/) as our test runner.

## Writing contract

Copy the token contract file from step04 and paste in the `contracts` directory here.

## Writting Tests

Create a new directory called `test` inside our project root directory and create a new file in there called `Token.ts`.

Write the code.

In your terminal run `npx hardhat test`. You should see the following output:

```script
Compiled 1 Solidity file successfully


  Token contract
    ✔ Deployment should assign the total supply of tokens to the owner (1399ms)


  1 passing (1s)
  ```
This means the test passed.

