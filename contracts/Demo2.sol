pragma solidity ^0.4.15; 

contract Demo2 { 
    uint i = 0; 

    function addOne() public {
        i = i + 1; 
    }

    function add(uint num) public{ 
        i = i + num; 
    }

    function setZero() public {
        i = 0; 
    }

    function getI() public view returns(uint) {
        return i; 
    }
}