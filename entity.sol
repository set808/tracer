pragma solidity ^0.4.2;

contract Entity 
{
    string private name;
    address addy = this;
    
    function setName(string new_name) external
    {
        name = new_name;
    }
    
    function getName() constant public returns (string)
    {
        return (name);
    }
    
    function getAddress() constant public returns (address)
    {
        return (addy);
    }
}

contract Manufacturer is Entity
{
    string private ffl;
    
    function setFfl(string new_ffl) external
    {
        ffl = new_ffl;
    }
    
    function getFfl() constant public returns (string)
    {
        return (ffl);
    }
}

contract Dealer is Entity
{
    string private ffl;
    
    function setFfl(string new_ffl) external
    {
        ffl = new_ffl;
    }
    
    function getFfl() constant public returns (string)
    {
        return (ffl);
    }
}

contract Owner is Entity
{
    uint private age;
    
    function setAge(uint new_age) external
    {
        age = new_age;
    }
    
    function getAge() constant public returns (uint)
    {
        return (age);
    }
}