
pragma solidity ^0.4.2;
import "./entity.sol";
import "./asset.sol";

contract Tracer
{
        address[] buyerAccts;
        address[] vendorAccts;
        address[] manufacturerAccts;
        bytes32[] assetUUIDs;
    
    mapping (address => Buyer) buyers;
    mapping (string => Buyer) buyeraddress;
    mapping (address => Vendor) vendors;
    mapping (string => Vendor) vendoraddress;
    mapping (address => Manufacturer) manufacturers;
    mapping (string => Manufacturer) manufactureraddress;
    mapping (bytes32 => Asset) public assetStore;
    mapping (address => mapping(bytes32 => bool)) public entityStore;

    event AssetCreate(address account, bytes32 uuid, string manufacturer);
    event RejectCreate(address account, bytes32 uuid, string messid);
    event AssetTransfer(address from, address to, bytes32 uuid);
    event RejectTransfer(address from, address to, bytes32 uuid, string messid);

    constructor() public
    {
        
    }
    
    function createBuyer(string _name, uint _id) public
    {
        Buyer new_buyer = new Buyer(_name, _id);
        buyers[new_buyer] = new_buyer;
        buyeraddress[new_buyer.name()] = new_buyer;
        buyerAccts.push(new_buyer) - 1;
    }
    function createVendor(string _name, bool _license) public
    {
        Vendor new_vendor = new Vendor(_name, _license);
        vendors[new_vendor] = new_vendor;
        vendorAccts.push(new_vendor) - 1;
    }
    function createManufacturer(string _name, bool _license) public
    {
        Manufacturer new_man = new Manufacturer(_name, _license);
        manufacturers[new_man] = new_man;
        manufacturerAccts.push(new_man) - 1;
    }

    function createAsset(string _description, string _manufacturer, bool _initialized) public returns (bytes32)
    {
        Asset new_asset =  new Asset(new_asset, _description
, _manufacturer, _initialized);
        bytes32 uuid = new_asset.uuid();
        assetStore[uuid] = new_asset;
        entityStore[msg.sender][uuid] = true;
        assetUUIDs.push(uuid) - 1;
        return uuid;
    }
    
    function getBuyers() constant public returns (address[])
    {
        return buyerAccts;
    }
    function getVendors() constant public returns (address[])
    {
        return vendorAccts;
    }
    function getManufacturers() constant public returns (address[])
    {
        return manufacturerAccts;
    }
    function getAssetsUUIDs() constant public returns (bytes32[])
    {
        return assetUUIDs;
    }
    function getBuyer(address ins) constant public returns (string, uint)
    {
        return (buyers[ins].name(), buyers[ins].id());
    }
    function getVendor(address ins) constant public returns (string, bool)
    {
        return (vendors[ins].name(), vendors[ins].license());
    }
    function getBuyerAddress(string name) constant public returns (address)
    {
        return buyeraddress[name].buyer_add();
    }
    function getVendorAddress(string name) constant public returns (address)
    {
        return (vendoraddress[name].vendor_add());   
    }
    function getManufacturerAddress(string name) constant public returns (address)
    {
        return manufactureraddress[name].man_add();
    }
    function isBuyerOf(address buyer, bytes32 uuid) constant public returns (bool)
    {
        if (entityStore[buyer][uuid])
        {
            return true;
        }
        return false;
    }
    function transferAsset(address to, bytes32 uuid) public
    {
        if(!assetStore[uuid].initialized())
	    {
		    emit RejectTransfer(msg.sender, to, uuid, "No asset with this UUID exists");
		    return;
	    }
    	if(!entityStore[msg.sender][uuid])
    	{
		    emit RejectTransfer(msg.sender, to, uuid, "Sender does not buyer this asset.");
        	return;
		}
    
        entityStore[msg.sender][uuid] = false;
    	entityStore[to][uuid] = true;
    	emit AssetTransfer(msg.sender, to, uuid);
	}

	function getAssetByUUID(bytes32 uuid) public constant returns (string, string)
	{
 
        return (assetStore[uuid].description(), assetStore[uuid].manufact());
 
    }
}