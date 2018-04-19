pragma solidity ^0.4.2;

contract Owner
{
    bytes16 public name;
    uint public age;
    address public own_add;
    
    function Owner(bytes16 _name, uint _age) public
    {
        name = _name;
        age = _age;
        own_add = this;
    }
}

contract Dealer
{
    bytes16 public name;
    bool public ffl;
    address public deal_add;
    
    function Dealer(bytes16 _name, bool _ffl) public
    {
        name = _name;
        ffl = _ffl;
        deal_add = this;
    }
}

contract Manufacturer
{
    bytes16 name;
    bool ffl;
    address deal_add;
    
    function Manufacturer(bytes16 _name, bool _ffl) public
    {
        name = _name;
        ffl = _ffl;
        deal_add = this;
    }
}