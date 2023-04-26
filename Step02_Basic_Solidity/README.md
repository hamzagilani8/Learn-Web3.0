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

## Learn Data Types for Solidity

* [Bytes vs Bits](https://www.youtube.com/watch?v=Dnd28lQHquU)
* [Solidity Types](https://docs.soliditylang.org/en/latest/types.html)

# Functions


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

