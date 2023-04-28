# Full coverage

Now that we've covered the basics that you'll need for testing your contracts, here's a full test suite for the token with a lot of additional information about Mocha and how to structure your tests. We recommend reading it thoroughly.

This is what the output of `npx hardhat test` should look like against the full test suite:

```script
npx hardhat test                                         

  Token contract
    Deployment
      ✔ Should set the right owner (1238ms)
      ✔ Should assign the total supply of tokens to the owner
    Transactions
      ✔ Should transfer tokens between accounts (93ms)
      ✔ Should emit Transfer events
      ✔ Should fail if sender doesn't have enough tokens (50ms)


  5 passing (1s)
```