pragma solidity ^0.4.24;

contract Math {
    uint public ans;
    
    function add(uint a,uint b) public {
        ans = a + b;
    }
}

// @title Modularized smart contract: Delegate
// @author Hu Yao-Chieh (yhuag@connect.ust.hk)
// @dev This smart contract is modularized via inter-contract call.
contract Delegate {
    
    uint public ans;
    
    address public target;
    
    function setTarget(address _tar) public {
        target = _tar;
    }
    
    function callAdd(uint c,uint d) public {
        target.call(bytes4(keccak256("add(uint256,uint256)")), c,d);
    }
    
}