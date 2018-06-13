pragma solidity ^0.4.2;

contract Buyer
{
    string public name;
    uint public id;
    address public buyer_add;
    
    constructor(string _name, uint _id) public
    {
        name = _name;
        id = _id;
        buyer_add = this;
    }
}

contract Vendor
{
    string public name;
    bool public license;
    address public vendor_add;
    
    constructor(string _name, bool _license) public
    {
        name = _name;
        license = _license;
        vendor_add = this;
    }
}

contract Manufacturer
{
    string public name;
    bool public license;
    address public man_add;
    
    constructor(string _name, bool _license) public
    {
        name = _name;
        license = _license;
        man_add = this;
    }
}