pragma solidity ^0.4.2;

contract Owner
{
    struct owner
    {
        string name;
        uint age;
        
    }
    
    mapping (address => owner) owners;
    address[] public ownerAccts;
    
    function setOwner(string _name, uint _age) public
    {
        owner storage this_owner = owners[this];
        this_owner.name = _name;
        this_owner.age = _age;
        
        ownerAccts.push(this) + 1;
    }
    
    function getOwners() view public returns(address[]) {
        return ownerAccts;
    }
    
    function getOwner(address _address) view public returns(string, uint) {
        return (owners[_address].name, owners[_address].age);
    }
}

contract Dealer
{
    struct dealer
    {
        string name;
        bool ffl;
        
    }
    
    mapping (address => dealer) dealers;
    address[] public dealerAccts;
    
    function setDealer(string _name, bool _ffl) public
    {
        dealer storage this_dealer = dealers[this];
        this_dealer.name = _name;
        this_dealer.ffl = _ffl;
        
        dealerAccts.push(this) + 1;
    }
    
    function getDealers() view public returns(address[]) {
        return dealerAccts;
    }
    
    function getDealer(address _address) view public returns(string, uint) {
        return (dealers[_address].name, dealers[_address].ffl);
    }
}

contract Manufacturer
{
    struct manufacturer
    {
        string name;
        bool ffl;
        
    }
    
    mapping (address => manufacturer) manufacturers;
    address[] public manufacturerAccts;
    
    function setManufacturer(string _name, bool _ffl) public
    {
        manufacturer storage this_manufacturer = manufacturers[this];
        this_manufacturer.name = _name;
        this_manufacturer.ffl = _ffl;
        
        manufacturerAccts.push(this) + 1;
    }
    
    function getManufacturers() view public returns(address[]) {
        return manufacturerAccts;
    }
    
    function getManufacturer(address _address) view public returns(string, uint) {
        return (manufacturers[_address].name, manufacturers[_address].age);
    }
}