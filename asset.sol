pragma solidity ^0.4.2;

contract guns {
	     
    bytes32 public uuid;
    string public gun_type;
    string public manufact;
    bool public initialized;
    	        
    address[] public assetAccts;

    function guns(address _address, string _gun_type, string _manufact, bool _initialized) public {
                
        uuid = keccak256(_address);
        gun_type = _gun_type;
        manufact = _manufact;
        initialized = _initialized;
        
        assetAccts.push(_address) -1;
    }
}