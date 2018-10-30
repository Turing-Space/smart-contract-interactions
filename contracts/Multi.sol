pragma solidity ^0.4.24;

//// All Modules ////

// Module #0
contract CanPlus {
    function plus(uint _n1, uint _n2) public pure returns (uint ans) { return _n1 + _n2; }
}
// Module #1
contract CanMinus {
    function minus(uint _n1, uint _n2) public pure returns (uint ans) { return _n1 - _n2; }
}
// Module #2
contract CanMultiply {
    function multiply(uint _n1, uint _n2) public pure returns (uint ans) { return _n1 * _n2; }
}
// Module #3
contract CanDivide {
    function divide(uint _n1, uint _n2) public pure returns (uint ans) { return _n1 / _n2; }
}

// @title Modularized smart contract: Multiple inheritance
// @author Hu Yao-Chieh (yhuag@connect.ust.hk)
// @dev This smart contract is modularized via multiple inheritance, in which each parent class is regarded as a module.
contract Multi is CanPlus, CanMinus, CanMultiply, CanDivide {
    address owner;

    // Constructor
    constructor() public { owner = msg.sender; }
}