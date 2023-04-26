// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract functions{
    uint32 public age;

    function yourAge (uint32 _age) public {
        age = _age;
    }
}