pragma solidity ^0.4.20; 

contract myPostBox {
    string message; 
    int64 count; 
    event Posted(string message); 

    function postMsg(string text) public {
        Posted (text); 
        count++;
        message = text;  
    }

    function getMsg() public view returns(string) {
        return message; 
    }
    function getCount() public view returns(int64) {
        return count; 
    }
}