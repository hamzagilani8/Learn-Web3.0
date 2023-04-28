// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract loop{

uint[3] public arr;
uint public count;

// Create a simple for loop increment counter

function forLoop() public{
    for (uint256 i = count ; i < arr.length; i++) {
        arr[count] = count;
        count++;
    }
}

}