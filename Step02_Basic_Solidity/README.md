# Types of variables

In Solidity, there are three types of variables: state variables, local variables, and global variables.

- **State variables** are variables whose values are permanently stored in the contract's storage. They are declared outside of functions and represent the "state" or the condition of the contract. State variables can have different levels of visibility (public, private, internal) that determine how they can be accessed.

- **Local variables** are variables that are declared inside functions and their values are only present while the function is executing. They are not stored permanently and their values are lost when the function exits. Local variables can be used to store intermediate values or to perform calculations within a function.We would have a look at it latter on.

- **Global variables** provide information about the blockchain or the current transaction. They are not specific to a contract and their values are determined by the context in which the contract is executed. Some examples of global variables include `block.timestamp` (the current block timestamp), `msg.sender` (the address of the sender of the message), and `tx.origin` (the address that originated the transaction).



| Variable Type | Description |
| --- | --- |
| State | Variables whose values are permanently stored in the contract's storage. They represent the "state" or condition of the contract. |
| Local | Variables declared inside functions whose values are only present while the function is executing. They are not stored permanently and their values are lost when the function exits. |
| Global | Variables that provide information about the blockchain or the current transaction. Their values are determined by the context in which the contract is executed. |

### Learn Data Types for Solidity

* [Bytes vs Bits](https://www.youtube.com/watch?v=Dnd28lQHquU)
* [Solidity Types](https://docs.soliditylang.org/en/latest/types.html)

### Some common global Variables


| Global Variable | Usage | Properties |
|-----------------|-------|------------|
| msg.sender | Returns the address of the account that initiated the transaction or call | address |
| msg.value | Returns the amount of ether (in wei) that was sent along with the transaction or call | uint |
| msg.data | Returns the data field of the transaction or call, which contains the function selector and the arguments for the function being called | bytes calldata |
| msg.gas | Returns the remaining gas available for the current transaction or call | uint |
| block.number | Returns the number of the current block | uint |
| block.timestamp | Returns the timestamp of the current block as seconds since unix epoch | uint |
| block.coinbase | Returns the address of the miner who mined the current block | address payable |
| block.difficulty | Returns the difficulty of the current block (EVM < Paris). For other EVM versions it behaves as a deprecated alias for block.prevrandao (EIP-4399) | uint |
| block.gaslimit | Returns the maximum amount of gas that can be used in the current block | uint |
| tx.origin | Returns the address of the account that originally created the transaction (full call chain) | address |
| tx.gasprice | Returns the gas price (in wei) of the current transaction | uint |


# Modifiers

These are a feature of Solidity that allow you to modify the behavior of functions by adding some preconditions or postconditions to them. They can be used to reduce code duplication, enforce access control, or check some conditions before or after executing a function.

### Declare a modifier

use the syntax 
```javascript
modifier modifierName(parameters) {
     // modifier body 
     }
```
where `modifierName` is the name of the modifier, `parameters` are optional parameters that can be passed to the modifier, and `modifier body` is the code that defines the modifier logic. You can use the special keyword `_;` to mark where the function body should be inserted in the modifier.


# Use a modifier

You append it to the function declaration after the parameter list and before the function body. You can use multiple modifiers for a function by separating them with commas. You can also pass arguments to the modifiers if they have parameters.

Modifiers are useful for implementing common patterns in your smart contracts, such as restricting access to certain functions, validating inputs, or emitting events.

Here are some links to YouTube videos that explain more about modifiers in Solidity:

- [Modifier In solidity | How to create Modifiers In Solidity](https://www.youtube.com/watch?v=KZGm1LIYnlk) by Daulat Hussain
- [Function Modifier | Solidity 0.8](https://www.youtube.com/watch?v=b6FBWsz7VaI) by Smart Contract Programmer
- [Learning Solidity : Tutorial 3 Custom Modifiers and Error Handling](https://www.youtube.com/watch?v=3ObTNzDM3wI) by Will It Scale


### Some common modifiers in solidity

| Modifier | Feature | Usage |
|----------|---------|-------|
| payable | Allows a function to receive ether | Use for any function that needs to accept ether |
| view | Indicates that a function does not modify the state | Use for any function that only reads from the state |
| pure | Indicates that a function does not interact with the state | Use for any function that only depends on its inputs and outputs |
| external | Indicates that a function can only be called from outside the contract | Use for any function that does not need to be called internally |
| internal | Indicates that a function can only be called from within the contract or from derived contracts | Use for any function that does not need to be called externally |
| public | Indicates that a function can be called from anywhere | Use for any function that needs to be accessible by anyone |
| private | Indicates that a function can only be called from within the contract where it is defined | Use for any function that does not need to be accessible by anyone else |


# Visibility
## State Variable Visibility

### Public
The compiler automatically generates getter functions for public state variables, allowing other contracts to read their values. Within the same contract, external access invokes the getter while internal access gets the value directly from storage. Setter functions are not generated.

### Internal
These state variables can only be accessed within the contract they are defined in and in derived contracts. They cannot be accessed externally.

### Private
Similar to internal state variables, but not visible in derived contracts.

### Note
`Making a state variable private or internal only prevents other contracts from accessing it. The information is still visible outside of the blockchain.`

## Function Visibility

### External
These functions are part of the contract interface and can be called from other contracts and via transactions. They cannot be called internally.

### Public
These functions are part of the contract interface and can be called either internally or via message calls.

### Internal
These functions can only be accessed within the current contract or contracts deriving from it. They cannot be accessed externally and can take parameters of internal types.

### Private
Similar to internal functions, but not visible in derived contracts.

### Note
`Making a function private or internal only prevents other contracts from accessing it. The information is still visible outside of the blockchain.`

# Difference between View and Pure Functions

Detailed table that differentiates between `view` and `pure` functions in Solidity:

| Function Type | Description | Reads State Variables | Modifies State Variables |
| --- | --- | --- | --- |
| `view` | Read-only functions that do not modify the state of the blockchain. They can only view data on the blockchain. | Yes | No |
| `pure` | Functions that do not read or modify the state variables. They return values only using the parameters passed to the function or local variables present in it. | No | No |

# Constructor

In Solidity, a `constructor` is a special function that is called only once at the time of contract creation. It is used to initialize the state variables of a smart contract. The `constructor` function is defined using the `constructor` keyword and is optional.

A contract can have only one constructor. If no constructor is defined, a default constructor is present in the contract. A constructor can be either public or internal. An internal constructor marks the contract as abstract.

Main uses of a constructor are:
* Initializing State variables
* Setting Owner of the contract
* etc

# EVM storage and access

- **Calldata** is a special data location that contains the function arguments, only available for external function call parameters. It is immutable and has a limited size. For example, if you have a function that takes an array as an argument and you want to call it from another contract, you have to use calldata as the data location for the array parameter. Here is an example of using calldata:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function foo(uint256[] calldata _arr) external pure returns (uint256) {
        // do something with _arr
        return _arr.length;
    }
}

contract B {
    A a = new A();

    function bar() external {
        uint256[] memory arr = new uint256[](3);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        // call foo with arr as calldata
        uint256 result = a.foo(arr);
    }
}
```

- **Memory** is used to hold temporary variables during function execution. It is mutable and can be used for both function declaration parameters as well as within the function logic. It is non-persistent and does not affect the state of the contract. For example, if you have a function that creates a new array in memory and returns it, you have to use memory as the data location for the array variable. Here is an example of using memory:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function baz() external pure returns (uint256[] memory) {
        // create a new array in memory
        uint256[] memory arr = new uint256[](3);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        // return the array
        return arr;
    }
}
```

- **Storage** is used to store data permanently on the blockchain. It is where all state variables are stored and can be modified by the contract. It is persistent and affects the state of the contract. For example, if you have a state variable that is an array and you want to append a new element to it, you have to use storage as the data location for the array variable. Here is an example of using storage:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract D {
    // state variable stored in storage
    uint256[] public arr;

    function qux(uint256 _value) external {
        // append a new element to arr
        arr.push(_value);
    }
}
```

Here are some links to YouTube videos that explain more about calldata, memory and storage in Solidity:

- [Storage, Memory and Calldata | Solidity 0.8](https://www.youtube.com/watch?v=wOCIhzAuhgs) by Smart Contract Programmer
- [Solidity : Storage, Memory, Stack & Calldata](https://www.youtube.com/watch?v=p_BbCBSB9FM) by Ben BK

You can also learn more about storage and access rules from book:

- Part 1 Chapter 3 pages 79-85 of [Solidity Learning Essentials](https://github.com/hamzagilani8/Learn-Web3.0/blob/main/Books/SOLIDITY_PROGRAMMING_ESSENTIALS.pdf)

# Mapping

- **Mapping** is a data structure that allows you to store key-value pairs, where the key can be any type except for a mapping, a dynamically sized array, a contract, an enum or a struct. The value can be any type, including another mapping or an array. Mapping is useful for storing and retrieving data efficiently by using the key as an index.
- To declare a mapping, you use the syntax `mapping(_KeyType => _ValueType) _variableName;` where `_KeyType` is the type of the key, `_ValueType` is the type of the value and `_variableName` is the name of the mapping variable. For example, `mapping(address => uint) public balances;` declares a mapping that maps an address to a uint and assigns it to a public state variable called balances².
- To access or modify the value associated with a key in a mapping, you use the syntax `_variableName[_key]`. For example, `balances[msg.sender] = 100;` assigns 100 to the value corresponding to the sender's address in the balances mapping².
- Mappings are not iterable, meaning you cannot loop over them or get their size. If you need to do that, you can use an array to store the keys of the mapping and iterate over the array³.
- Mappings can also be nested, meaning you can have a mapping as the value type of another mapping. For example, `mapping(address => mapping(uint => bool)) public votes;` declares a mapping that maps an address to another mapping that maps a uint to a bool and assigns it to a public state variable called votes.

Here are some links to YouTube videos that explain more about mapping in Solidity:

- [Mapping | Solidity 0.8](https://www.youtube.com/watch?v=Q-wRG7pngn0) by Smart Contract Programmer
- [Solidity Tutorial: Mappings (simple mappings, nested mappings, array in mappings...)](https://www.youtube.com/watch?v=U-wWqTq1zoQ) by EatTheBlocks
- [Mapping in solidity | Solidity Latest Version | Solidity Full Course | Part -27 -A | Hindi](https://www.youtube.com/watch?v=WUzy80NYM9o) by Blockchain Engineer

# For Loop

It is a control structure that allows you to execute a block of code repeatedly for a specified number of times. It takes three expressions separated by semicolons: the first one is the initialization, where you declare and assign a variable to control the loop; the second one is the condition, where you specify when the loop should stop; and the third one is the final expression, where you update the variable after each iteration. For example, `for (uint i = 0; i < 10; i++) { // do something }` declares a variable `i` and assigns it to 0, then checks if `i` is less than 10, then executes the block of code, then increments `i` by 1, and repeats this process until `i` is equal to or greater than 10.

### Nested For Loops

For loops can also be nested, meaning you can have a for loop inside another for loop. This is useful for iterating over multidimensional arrays or other complex data structures. For example,
```javascript
uint[][] public matrix = [[1, 2], [3, 4], [5, 6]]; 
function printMatrix() public view { 
    for (uint i = 0; i < matrix.length; i++) { 
        for (uint j = 0; j < matrix[i].length; j++) { 
            // print matrix[i][j] 
        } 
    } 
}
```
declares a two-dimensional array of numbers and a function that prints each element of the array. The function uses a nested for loop to iterate over the rows and columns of the array³.

Here are some links to YouTube videos that explain more about for loop in Solidity:

- [For Loop In Solidity Programming Language](https://www.youtube.com/watch?v=Ih-rbpOqTN0) by Daulat Hussain
- [For and While Loops | Solidity 0.8](https://www.youtube.com/watch?v=SB705OK3bUg) by Smart Contract Programmer
- [Loops in solidity | While loop | For loop | Do while loop](https://www.youtube.com/watch?v=ENgQ56JeJd0) by Blockchain Engineer

# If-Else conditionals

It is a control structure that allows you to execute a block of code if a certain condition is true and another block of code if the condition is false. It has the syntax 
```javascript
if (condition) {
    // do something 
     } else { 
    // do something else
    }
```
 where `condition` is a boolean expression that evaluates to true or false.

### Else-if
it is used to chain multiple conditions and execute different blocks of code depending on which condition is true. It has the syntax 
```javascript
if (condition1) {
    // do something 
    } else if (condition2) {
        // do something else 
    } else {
        // do something different 
        }
```
 where `condition1` and `condition2` are boolean expressions that evaluate to true or false.

Here are some links to YouTube videos that explain more about if else in Solidity:

- [If Else | Solidity 0.8](https://www.youtube.com/watch?v=Ld8bFWXLSfs) by Smart Contract Programmer
- [If, Else In Solidity | Complete Solidity Course 2022](https://www.youtube.com/watch?v=jDQqJd3P0RQ) by Daulat Hussain

Here are some links to document references that explain more about if else in Solidity:

- [If / Else - Solidity by Example](https://solidity-by-example.org/if-else/) by solidity-by-example.org
- [If-Else Statement in Solidity - GeeksforGeeks](https://www.geeksforgeeks.org/if-else-statement-in-solidity/) by geeksforgeeks.org


### Lets move on to advanced solidity!