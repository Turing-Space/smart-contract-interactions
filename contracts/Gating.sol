pragma solidity ^0.4.24;

// @title Modularized smart contract: Gating
// @author Hu Yao-Chieh (yhuag@connect.ust.hk)
// @dev This smart contract is modularized by switching on/off a specific module via modifier access control mapping.
contract Gating {
    address owner;
    mapping (uint => bool) public enabled;
    
    // Constructor
    constructor() public { owner = msg.sender; }
    
    // Modifiers
    modifier onlyEnabled(uint _funcId) {
        require(enabled[_funcId]);
        _;
    }
    
    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }
    
    //// All Modules ////
    
    // Module #0
    function plus(uint _n1, uint _n2) public view onlyEnabled(0) returns (uint ans) { assembly { ans:= add(_n1,_n2) } }
    // Module #1
    function minus(uint _n1, uint _n2) public view onlyEnabled(1) returns (uint ans) { assembly { ans:= sub(_n1,_n2) } }
    // Module #2
    function multiply(uint _n1, uint _n2) public view onlyEnabled(2) returns (uint ans) { assembly { ans:= mul(_n1,_n2) } }
    // Module #3
    function divide(uint _n1, uint _n2) public view onlyEnabled(3) returns (uint ans) { assembly { ans:= div(_n1,_n2) } }
    

    //// Gates ////
    function enableFunction(uint _funcId) public onlyOwner { enabled[_funcId] = true; }
    function disableFunction(uint _funcId) public onlyOwner { enabled[_funcId] = false; }
    function toggleFunction(uint _funcId) public onlyOwner { enabled[_funcId] = !enabled[_funcId]; }
    
}