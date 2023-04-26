// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract functions{
   uint data;

  function setter(uint _data) public {
    data = _data;
  }

  function getter() public view returns(uint) {
    return data;
  }
}