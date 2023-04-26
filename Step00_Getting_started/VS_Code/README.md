
## Settingup the environment

* Install the extenstion named `Solidity` in your VS Code
* Make a new folder named 'contract'
* Make a new file in that folder with the extention `.sol` in the format `<fileName>.sol`

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

## Now compile the code by pressing `F5`

You would get a success message at the output terminal
```javascript
Retrieving compiler information:
Compiler using remote version: 'latest', solidity version: 0.8.19+commit.7dd6d404.Emscripten.clang
Compilation completed successfully!
```

### Your first contract compiled sucessfully