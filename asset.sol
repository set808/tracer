pragma solidity ^0.4.2;

contract Asset {
	     
    bytes32 public uuid;
    string public description;
    string public manufact;
    bool public initialized;
    	        
    address[] public assetAccts;

    constructor(address _address, string _description, string _manufact, bool _initialized) public {
                
        uuid = keccak256(abi.encodePacked(_address));
        description  = _description;
        manufact = _manufact;
        initialized = _initialized;
        
        assetAccts.push(_address) -1;
    }
}