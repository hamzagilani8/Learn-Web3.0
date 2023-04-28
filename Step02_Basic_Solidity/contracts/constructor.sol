// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract constructors {
   
   address owner;

// Constructor without argument
//    constructor(){
//     owner=0x03f3dCb7B9BBeBd21B3097dDC0389AA2425eC825;
//    }

// Constructor with argument
constructor(address _owner){
    owner= _owner;
}

}