# Getting started with Remix IDE

Open the remix IDE using the following link and login/signup
https://remix.ethereum.org/

### Settingup the environment

* Delete all the files and folders except the folder named 'Contract'
* Delete all the files in the 'Contract' folder
* Create a new file in the 'Contract' folder with the ".sol" extention in the format `<fileName>.sol`

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
### Your first contract compiled sucessfully