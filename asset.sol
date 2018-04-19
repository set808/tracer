pragma solidity ^0.4.2;

contract guns {
	    
    bytes32 public uuid;
    bytes16 public gun_type;
    bytes16 public manufact;
    bool public initialized;
    	       
    address[] public assetAccts;

    function guns(address _address, bytes16 _gun_type, bytes16 _manufact, bool _initialized) public {
                
        uuid = keccak256(_address);
        gun_type = _gun_type;
        manufact = _manufact;
        initialized = _initialized;
        
        assetAccts.push(_address) -1;
    }
}