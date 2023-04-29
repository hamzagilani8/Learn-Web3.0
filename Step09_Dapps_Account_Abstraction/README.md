# Account Abstraction using Userop.js

Userop.js is an open-source library for building ERC-4337 UserOperations. UserOperations are a new way of interacting with the Ethereum blockchain using smart contract accounts or smart accounts. UserOperations allow users to execute a list of actions atomically and validate them according to their own logic. UserOperations also enable gasless transactions, where users can pay gas fees with ERC20 tokens or have someone else pay for them.

Userop.js provides a simple and flexible interface for creating and sending UserOperations to ERC-4337 bundlers, which are services that submit UserOperations to the blockchain on behalf of the users. Userop.js also provides some common presets for building and signing UserOperations using existing smart account implementations and middleware functions.

To use userop.js, you need to install it as an npm package and import it in your project. You can then use the `Client` class to connect to a bundler service and send UserOperations. You can also use the `Builder` class to create UserOperations using different smart account presets or your own custom logic. You can also use middleware functions to add additional logic or features to your UserOperations, such as estimating gas, getting gas price, requesting sponsorship, etc.

Here is an example of using userop.js to create and send a UserOperation that transfers ETH from a smart account to another address¹:

```javascript
// Import userop.js and ethers.js
const { Client, Presets } = require("userop");
const { ethers } = require("ethers");

// Define some constants
const rpcUrl = "https://mainnet.infura.io/v3/<YOUR-PROJECT-ID>";
const entryPoint = "0x0000000000000000000000000000000000000000"; // The entry point address for ERC-4337
const simpleAccountFactory = "0x0000000000000000000000000000000000000000"; // The address of the SimpleAccount factory contract
const signingKey = "0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"; // The private key of the user
const target = "0x1234567890123456789012345678901234567890"; // The address to transfer ETH to
const value = ethers.utils.parseEther("0.1"); // The amount of ETH to transfer

// Create a provider and a signer using ethers.js
const provider = new ethers.providers.JsonRpcProvider(rpcUrl);
const signer = new ethers.Wallet(signingKey);

// Create a smart account builder using the SimpleAccount preset
const simpleAccount = await Presets.Builder.SimpleAccount.init(
  signer,
  provider,
  entryPoint,
  simpleAccountFactory
);

// Create a client to connect to a bundler service
const client = await Client.init(provider, entryPoint);

// Create and send a UserOperation that transfers ETH from the smart account to the target address
const res = await client.sendUserOperation(
  simpleAccount.execute(target, value, "0x"),
  {
    onBuild: (op) => console.log("Signed UserOperation:", op),
  }
);

console.log(`UserOpHash: ${res.userOpHash}`);

console.log("Waiting for transaction...");
const ev = await res.wait();
console.log(`Transaction hash: ${ev?.transactionHash ?? null}`);
```

### Code Explaination

Sure, I'll try to explain what each line of code does.

```javascript
// Import userop.js and ethers.js
const { Client, Presets } = require("userop");
const { ethers } = require("ethers");
```
This line imports the userop.js and ethers.js libraries. Userop.js is the library for building and sending UserOperations. Ethers.js is a library for interacting with the Ethereum blockchain.

```javascript
// Define some constants
const rpcUrl = "https://mainnet.infura.io/v3/<YOUR-PROJECT-ID>";
const entryPoint = "0x0000000000000000000000000000000000000000"; // The entry point address for ERC-4337
const simpleAccountFactory = "0x0000000000000000000000000000000000000000"; // The address of the SimpleAccount factory contract
const signingKey = "0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"; // The private key of the user
const target = "0x1234567890123456789012345678901234567890"; // The address to transfer ETH to
const value = ethers.utils.parseEther("0.1"); // The amount of ETH to transfer
```
This line defines some constants that are used in the code. They are:

- `rpcUrl`: The URL of the JSON-RPC provider that connects to the Ethereum blockchain. In this case, it uses Infura, a service that provides access to Ethereum nodes. You need to replace `<YOUR-PROJECT-ID>` with your own project ID from Infura.
- `entryPoint`: The address of the entry point contract for ERC-4337. This is a special contract that receives UserOperations from bundlers and executes them on the blockchain. The address of the entry point contract is fixed and can be found in the ERC-4337 specification.
- `simpleAccountFactory`: The address of the SimpleAccount factory contract. This is a contract that deploys SimpleAccount contracts, which are a type of smart account that conforms to ERC-4337. The address of the SimpleAccount factory contract can be found in the SimpleAccount repository.
- `signingKey`: The private key of the user who wants to send UserOperations. This is used to sign the UserOperations and prove their identity. You need to replace this with your own private key or generate a new one using ethers.js.
- `target`: The address of the recipient of the ETH transfer. This can be any valid Ethereum address that you want to send ETH to.
- `value`: The amount of ETH to transfer in wei. Wei is the smallest unit of ETH, where 1 ETH = 10^18 wei. This line uses a helper function from ethers.js to parse 0.1 ETH into wei.

```javascript
// Create a provider and a signer using ethers.js
const provider = new ethers.providers.JsonRpcProvider(rpcUrl);
const signer = new ethers.Wallet(signingKey);
```
This line creates a provider and a signer using ethers.js. A provider is an object that connects to the Ethereum blockchain and allows you to read data and send transactions. A signer is an object that holds a private key and allows you to sign data and transactions.

```javascript
// Create a smart account builder using the SimpleAccount preset
const simpleAccount = await Presets.Builder.SimpleAccount.init(
  signer,
  provider,
  entryPoint,
  simpleAccountFactory
);
```
This line creates a smart account builder using the SimpleAccount preset from userop.js. A smart account builder is an object that helps you create UserOperations using a specific smart account implementation. In this case, it uses the SimpleAccount implementation, which is a simple and flexible type of smart account that conforms to ERC-4337. The `init` method takes four arguments:

- `signer`: The signer object that holds the user's private key.
- `provider`: The provider object that connects to the Ethereum blockchain.
- `entryPoint`: The address of the entry point contract for ERC-4337.
- `simpleAccountFactory`: The address of the SimpleAccount factory contract.

The `init` method returns a promise that resolves to a smart account builder object.

```javascript
// Create a client to connect to a bundler service
const client = await Client.init(provider, entryPoint);
```
This line creates a client object using userop.js. A client object allows you to send UserOperations to a bundler service, which is a service that submits UserOperations to the blockchain on behalf of the users. The `init` method takes two arguments:

- `provider`: The provider object that connects to the Ethereum blockchain.

Okay, here is the rest of the explanation:

```javascript
// Create and send a UserOperation that transfers ETH from the smart account to the target address
const res = await client.sendUserOperation(
  simpleAccount.execute(target, value, "0x"),
  {
    onBuild: (op) => console.log("Signed UserOperation:", op),
  }
);
```
This line creates and sends a UserOperation that transfers ETH from the smart account to the target address. The `sendUserOperation` method takes two arguments:

- The first argument is a UserOperation object that specifies the actions to execute. In this case, it uses the `execute` method of the smart account builder to create a UserOperation that makes a call to the target address with the value and an empty data. The `execute` method takes three arguments:
  - `target`: The address to call or transfer ETH to.
  - `value`: The amount of ETH to transfer in wei.
  - `data`: The data to send along with the call. In this case, it is an empty string ("0x").
- The second argument is an optional options object that can specify some callbacks or overrides for the UserOperation. In this case, it uses the `onBuild` callback to log the signed UserOperation to the console.

The `sendUserOperation` method returns a promise that resolves to a response object.

```javascript
console.log(`UserOpHash: ${res.userOpHash}`);
```
This line logs the user operation hash to the console. The user operation hash is a unique identifier for the UserOperation that can be used to track its status or receipt.

```javascript
console.log("Waiting for transaction...");
const ev = await res.wait();
console.log(`Transaction hash: ${ev?.transactionHash ?? null}`);
```
This line waits for the transaction that executes the UserOperation to be mined and confirmed on the blockchain. The `wait` method returns a promise that resolves to an event object that contains information about the transaction, such as its hash, status, block number, etc. This line logs the transaction hash to the console. If the transaction failed or was not found, it logs null instead.