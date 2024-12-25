// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract VirtualPropery {
    uint private price;
    address public owner;

    constructor() {
        price = 0;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _; // @Todo: check what is this
    }

    function changeOwner(address _owner) public onlyOwner {
        owner = _owner;
    }

    function setPrice(uint _price) public {
        price = _price;
    }

    function getPrice() view public returns (uint) {
        return price;
    }

    // Event
    event OwnerChanged(address owner);

}