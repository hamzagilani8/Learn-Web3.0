
## Settingup the environment

Run the following commands in your terminal

```javascript
npm init

npm install --save-dev hardhat

npx hardhat
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

### by pressing `F5` (Using Extenstion)

You would get a success message at the output terminal
```javascript
Retrieving compiler information:
Compiler using remote version: 'latest', solidity version: 0.8.19+commit.7dd6d404.Emscripten.clang
Compilation completed successfully!
```
### by cusing slocjs
```javascript
solcjs --bin <fileName>.sol
```
### Your first contract compiled sucessfully