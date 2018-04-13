pragma solidity ^0.4.2;

contract guns {
    
    struct asset {
        uint serial;
        bytes32 uuid;
        string owner;
        string manufact;
        bool initialized;
    }
    
    mapping (address => asset) assets;
    address[] public assetAccts;
    
    function setAsset(address _address, uint _serial, string _manufact, string _owner, bool _initialized) public {
        var asset = assets[_address];
        
        asset.serial = _serial;
        asset.uuid = keccak256(_address);
        asset.owner = _owner;
        asset.manufact = _manufact;
        asset.initialized = _initialized;
        
        assetAccts.push(_address) -1;
    }
    
    function getAssets() view public returns(address[]) {
        return assetAccts;
    }
    
    function getAsset(address _address) view public returns(uint, string, string, bytes32, bool) {
        return (assets[_address].serial, assets[_address].manufact, assets[_address].owner, assets[_address].uuid, assets[_address].initialized);
    }
    
}