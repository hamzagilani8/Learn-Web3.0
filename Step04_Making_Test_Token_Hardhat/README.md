# Sample Token Contract

We're going to create a simple smart contract that implements a token that can be transferred. Token contracts are most frequently used to exchange or store value. We won't go in depth into the Solidity code of the contract, but there's some logic we implemented that you should know:

- There is a fixed total supply of tokens that can't be changed.
- The entire supply is assigned to the address that deploys the contract.
- Anyone can receive tokens.
- Anyone with at least one token can transfer tokens.
- The token is non-divisible. You can transfer 1, 2, 3 or 37 tokens but not 2.5.

### Repeat step00B to get started

### Writting Contract

Start by creating a new directory called `contracts` and create a file inside the directory called `Token.sol`.

Write your contract here.

### Compiling Code

Use the command 

```script
npx hardhat compile
```
To compile the code and see the success message `Compiled 1 Solidity file successfully`