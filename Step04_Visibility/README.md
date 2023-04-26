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