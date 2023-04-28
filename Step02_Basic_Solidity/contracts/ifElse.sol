// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract ifElse{

function check(int a) public pure returns (string memory value){

    if(a>10){
        value="Value given is greater than 10";
    }else{
        value="Value might be greater or less than 10";
    }

    return value;
}

function check2(int a) public pure returns (string memory value){

    if(a>10){
        value="Value given is greater than 10";
    }else if(a<10){
        value="Value is less than 10";
    }else{
        value="Value might be greater or less than 10";
    }

    return value;
}

}