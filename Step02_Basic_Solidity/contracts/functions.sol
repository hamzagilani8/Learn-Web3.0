// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract functions{
   uint data;

  function updateData(uint _data) public {
    data = _data;
  }

  function readData() public view returns(uint) {
    return data;
  }
}