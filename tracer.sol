pragma solidity ^0.4.2;                                                                                   
import "./entity.sol";                                                                                    
import "./asset.sol";                                                                                     
                                                                                                          
contract Tracer                                                                                           
{                                                                                                         
        address[] buyerAccts;                                                                             
        address[] vendorAccts;                                                                            
        address[] manufacturerAccts;                                                                      
                                                                                                          
    mapping (address => Buyer) buyers;                                                                    
    mapping (string => Buyer) buyeraddress;                                                               
    mapping (address => Vendor) vendors;                                                                  
    mapping (string => Vendor) vendoraddress;                                                             
    mapping (address => Manufacturer) manufacturers;                                                      
    mapping (string => Manufacturer) manufactureraddress;                                                 
    mapping (bytes32 => Asset) public assetStore;                                                         
    mapping (address => mapping(bytes32 => bool)) public entityStore;                                     
                                                                                                          
    event AssetCreate(address account, bytes32 uuid, string manufacturer);                                
    event RejectCreate(address account, bytes32 uuid, string message);                                    
    event AssetTransfer(address from, address to, bytes32 uuid);                                          
    event RejectTransfer(address from, address to, bytes32 uuid, string message); 
    
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
        Manufacturer new_man = new Manufacturer(_name, _license
);                                             
        manufacturers[new_man] = new_man;                                                                 
        manufacturerAccts.push(new_man) - 1;                                                              
    }                                                                                                     
                                                                                                          
    function createAsset(string _description, string _manufacturer, bool _initialized) public returns (bytes32)                                                                                                       
    {                                                                                                     
        Asset new_asset =  new Asset(new_asset, _description, _manufacturer, _initialized);                   
        bytes32 uuid = new_asset.uuid();                                                                  
        assetStore[uuid] = new_asset;                                                                     
        entityStore[msg.sender][uuid] = true;                                                             
        return uuid;
    }
}