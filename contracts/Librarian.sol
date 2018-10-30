pragma solidity ^0.4.24;

//// All Modules ////

contract Math {
    // Module #0
    function plus(uint _n1, uint _n2) public pure returns (uint) { return _n1 + _n2; }
    // Module #1
    function minus(uint _n1, uint _n2) public pure returns (uint ans) { return _n1 - _n2; }
    // Module #2
    function multiply(uint _n1, uint _n2) public pure returns (uint ans) { return _n1 * _n2; }
    // Module #3
    function divide(uint _n1, uint _n2) public pure returns (uint ans) { return _n1 / _n2; }
}

// @title Modularized smart contract: Library
// @author Hu Yao-Chieh (yhuag@connect.ust.hk)
// @dev This smart contract is modularized via library call, in which the library stores all the modules.
contract Librarian{
    address owner;

    // Constructor
    constructor() public { owner = msg.sender; }
    
    //// Library ////
    Math math = Math(0xf40a7d54ad15e9535148bcdc07e17d3986415de5);
    function setMathLibrary(address _target) public { math = Math(_target); }
    
    // Module #0
    function plus(uint _n1, uint _n2) public view returns (uint) { return math.plus(_n1,_n2); }
    // Module #1
    function minus(uint _n1, uint _n2) public view returns (uint ans) { return math.minus(_n1,_n2); }
    // Module #2
    function multiply(uint _n1, uint _n2) public view returns (uint ans) { return math.multiply(_n1,_n2); }
    // Module #3
    function divide(uint _n1, uint _n2) public view returns (uint ans) { return math.divide(_n1,_n2); }
    
}