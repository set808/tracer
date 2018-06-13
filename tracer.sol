pragma solidity ^0.4.2;
import "./entity.sol";
import "./asset.sol";

contract Tracer
{
        address[] ownerAccts;
        address[] dealerAccts;
        address[] manufacturerAccts;
    
    mapping (address => Owner) owners;
    mapping (string => Owner) owneraddress;
    mapping (address => Dealer) dealers;
    mapping (string => Dealer) dealeraddress;
    mapping (address => Manufacturer) manufacturers;
    mapping (string => Manufacturer) manufactureraddress;
    mapping (bytes32 => guns) public assetStore;
    mapping (address => mapping(bytes32 => bool)) public entityStore;

    event AssetCreate(address account, bytes32 uuid, string manufacturer);
    event RejectCreate(address account, bytes32 uuid, string message);
    event AssetTransfer(address from, address to, bytes32 uuid);
    event RejectTransfer(address from, address to, bytes32 uuid, string message);
    
    function createOwner(string _name, uint _age) public
    {
        Owner new_owner = new Owner(_name, _age);
        owners[new_owner] = new_owner;
        owneraddress[new_owner.name()] = new_owner;
        ownerAccts.push(new_owner) - 1;
    }
    function createDealer(string _name, bool _ffl) public
    {
        Dealer new_dealer = new Dealer(_name, _ffl);
        dealers[new_dealer] = new_dealer;
        dealerAccts.push(new_dealer) - 1;
    }
    function createManufacturer(string _name, bool _ffl) public
    {
        Manufacturer new_man = new Manufacturer(_name, _ffl);
        manufacturers[new_man] = new_man;
        manufacturerAccts.push(new_man) - 1;
    }

    function createAsset(string _gun_type, string _manufacturer, bool _initialized) public returns (bytes32)
    {
        guns new_asset =  new guns(new_asset, _gun_type, _manufacturer, _initialized);
        bytes32 uuid = new_asset.uuid();
        assetStore[uuid] = new_asset;
        entityStore[msg.sender][uuid] = true;
        return uuid;
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
    function getOwner(address ins) constant public returns (string, uint)
    {
        return (owners[ins].name(), owners[ins].age());
    }
    function getDealer(address ins) constant public returns (string, bool)
    {
        return (dealers[ins].name(), dealers[ins].ffl());
    }
    function getOwnerAddress(string name) constant public returns (address)
    {
        return owneraddress[name].own_add();
    }
    function getDealerAddress(string name) constant public returns (address)
    {
        return (dealeraddress[name].deal_add());   
    }
    function getManufacturerAddress(string name) constant public returns (address)
    {
        return manufactureraddress[name].man_add();
    }
    function isOwnerOf(address owner, bytes32 uuid) constant public returns (bool)
    {
        if (entityStore[owner][uuid])
        {
            return true;
        }
        return false;
    }
    function transferAsset(address to, bytes32 uuid) public
    {
        if(!assetStore[uuid].initialized())
	    {
		    RejectTransfer(msg.sender, to, uuid, "No asset with this UUID exists");
		    			           return;
    						   }
    						   if(!entityStore[msg.sender][uuid])
    						   {
							    RejectTransfer(msg.sender, to, uuid, "Sender does not own this asset.");
        						    return;
							        }
    
        entityStore[msg.sender][uuid] = false;
    	entityStore[to][uuid] = true;
    	AssetTransfer(msg.sender, to, uuid);
	}

	function getAssetByUUID(bytes32 uuid) constant returns (string, string)
	{
 
 return (assetStore[uuid].gun_type(), assetStore[uuid].manufact());
 
 }

    
    function getAsset(bytes32 uuid) view public returns(string, string, bytes32, bool) {
        return (assetStore[uuid].gun_type(), assetStore[uuid].manufact(), assetStore[uuid].uuid(), assetStore[uuid].initialized());
    }
    

}