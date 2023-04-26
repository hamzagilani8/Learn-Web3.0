// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract structsnArrays{

// This is how a struct is made
    struct Person {
        uint32 age;
        string name;
    }

// Making a Dynamic Array
Person[] public People;

// Making a fixed-size Array
Person[3] public threePeople; // It can only store 3 Person Type data.

function addPeople (uint32 _age, string memory _name) public {
    People.push(Person(_age, _name));
}
    
}