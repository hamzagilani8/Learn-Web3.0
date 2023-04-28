// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract mappings{

    struct Person {
        uint32 age;
        string name;
    }

mapping(string => uint32) public nameToAge; //declaration for mapping

Person[] public People;

function addPeople (uint32 _age, string memory _name) public {
    People.push(Person(_age, _name));
    nameToAge[_name] = _age; // mapping
}
}