
## Settingup the environment

Run the following commands in your terminal

```javascript
npm init

npm install --save-dev hardhat

npx hardhat
```

Install typescript by using the command
```script
npm install --save-dev typescript
npm install --save-dev ts-node
```

now run the following commands to install some useful plugins

```javascript
npm install --save-dev @nomicfoundation/hardhat-toolbox
```

Go to the contracts folder

### License

Add this code in the first line to avoid compile time errors

```javascript
// SPDX-License-Identifier: MIT
```

### Pragma

Pragma is used to tell the compiler about version of solidity being used.

It can be written in many different ways:

```javascript
pragma solidity >=0.8.2 <0.9.0;
```

This tells the compiler to use solidity version that is either `0.8.2` or latest but not latest to `0.9.0`

#### OR

```javascript
pragma solidity ^0.8.2;
```

This tells the compiler to use solidity version that is either `0.8.2` or latest

### Your first contract

Make a contract using the keyword `contract` in the format
```javascript
contract <contractName> {

}
```

## Now compile the code 

```javascript
npx hardhat compile
```

You would get a success message at the output terminal

`Compiled 1 Solidity file successfully`

### Your first contract compiled sucessfully