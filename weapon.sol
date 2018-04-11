pragma solidity ^0.4.2;

contract Weapon 
{
    string public name;
    string public manufacturer;
    string private current_owner;
    bytes32 private uuid;
    
    address addy = this;
    
    function setUuid(address this_address) external
    {
        uuid = keccak256(this_address);
    }
    
    function getUuid() constant public returns (bytes32)
    {
        return uuid;
    }
}