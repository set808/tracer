pragma solidity ^0.4.2;
import "./entity.sol";
import "./asset.sol";

contract Tracer
{
        address[] ownerAccts;
        address[] dealerAccts;
        address[] manufacturerAccts;
    
    mapping (address => Owner) owners;
    mapping (address => Dealer) dealers;
    mapping (address => Manufacturer) manufacturers;
    mapping (bytes32 => guns) public assetStore;
    mapping (address => mapping(bytes32 => bool)) public entityStore;

    event AssetCreate(address account, bytes32 uuid, bytes16 manufacturer);
    event RejectCreate(address account, bytes32 uuid, string message);
    event AssetTransfer(address from, address to, bytes32 uuid);
    event RejectTransfer(address from, address to, bytes32 uuid, string message);
    
    function createOwner(bytes16 _name, uint _age) public
    {
        Owner new_owner = new Owner(_name, _age);
        owners[new_owner] = new_owner;
        ownerAccts.push(new_owner) - 1;
    }
    function createDealer(bytes16 _name, bool _ffl) public
    {
        Dealer new_dealer = new Dealer(_name, _ffl);
        dealers[new_dealer] = new_dealer;
        dealerAccts.push(new_dealer) - 1;
    }
    function createManufacturer(bytes16 _name, bool _ffl) public
    {
        Manufacturer new_man = new Manufacturer(_name, _ffl);
        manufacturers[new_man] = new_man;
        manufacturerAccts.push(new_man) - 1;
    }

    function createAsset(bytes16 _gun_type, bytes16 _manufacturer, bool _initialized) public
    {
        guns new_asset =  new guns(new_asset, _gun_type, _manufacturer, _initialized);
        bytes32 uuid = new_asset.uuid();
        assetStore[uuid] = new_asset;
        entityStore[msg.sender][uuid] = true;
    }
    
    function getOwners() constant public returns (address[])
    {
        return ownerAccts;
    }
    function getDealers() constant public returns (address[])
    {
        return dealerAccts;
    }
    function getManufacturers() constant public returns (address[])
    {
        return manufacturerAccts;
    }
    function getOwner(address ins) constant public returns (bytes16, uint)
    {
        return (owners[ins].name(), owners[ins].age());
    }
     function getDealer(address ins) constant public returns (bytes16, bool)
    {
        return (dealers[ins].name(), dealers[ins].ffl());
    }
     function getManufacturer(address ins) constant public returns (bytes16, bool)
    {
        return (manufacturers[ins].name(), manufacturers[ins].ffl());
    }
    function isOwnerOf(address owner, bytes32 uuid) constant public returns (bool)
    {
        if (entityStore[owner][uuid])
        {
            return true;
        }
        return false;
    }
    function transferAsset(address from, address to, bytes32 uuid) public
    {
	if(!assetStore[uuid].initialized)
	{
		RejectTransfer(msg.sender, to, uuid, "No asset with this UUID exists");
		return;
    	}
    	if(!entityStore[msg.sender][uuid])
    	{
		RejectTransfer(msg.sender, to, uuid, "Sender does not own this asset.");
        	return;
	}
 
	entityStore[from][uuid] = false;
    	entityStore[to][uuid] = true;
    	AssetTransfer(from, to, uuid);
	}	

	function getAssetByUUID(bytes32 uuid) constant returns (bytes16, bytes16)
	{
 
	return (assetStore[uuid].gun_type(), assetStore[uuid].manufact());
 
	}

    
    function getAsset(bytes32 uuid) view public returns(bytes16, bytes16, bytes32, bool) {
        return (assetStore[uuid].gun_type(), assetStore[uuid].manufact(), assetStore[uuid].uuid(), assetStore[uuid].initialized());
    }
    
}
