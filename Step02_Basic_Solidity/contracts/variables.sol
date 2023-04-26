// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

// There are three types of variables
// 1- state variables
// 2- local variables
// 3- Global variables

contract stateVariables {

bool myboolen = true; // The Boolean value that can hold true or false as its value.
string name = "Hamza"; // String can have any set of letters enclosed in qutation marks.
uint unsignedNumber = 123; // These are unsigned integers that can hold 0 and positive values only.
uint favNumber; // By default it is assigned the value of '0'.
int number = -54; // These are signed integers that can hold both negative and positive values.
address myAddress = 0x244887e15bf8e563d94De1223b32D612d2F1e428; // This represents an address of an account in the Ethereum environment.
bytes32 myBytes = "cat"; // This represents a fixed-sized byte array (byte1 to bytes32).
    
}

contract localVariables {

}

contract globalVariables{
    
}