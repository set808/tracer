pragma solidity ^0.4.2;

contract Owner
{
    string public name;
    uint public age;
    address public own_add;
    
    function Owner(string _name, uint _age) public
    {
        name = _name;
        age = _age;
        own_add = this;
    }
}

contract Dealer
{
    string public name;
    bool public ffl;
    address public deal_add;
    
    function Dealer(string _name, bool _ffl) public
    {
        name = _name;
        ffl = _ffl;
        deal_add = this;
    }
}

contract Manufacturer
{
    string public name;
    bool public ffl;
    address public man_add;
    
    function Manufacturer(string _name, bool _ffl) public
    {
        name = _name;
        ffl = _ffl;
        man_add = this;
    }
}