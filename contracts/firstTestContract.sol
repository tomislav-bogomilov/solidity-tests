//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;
 
contract Property{
    // declaring state variables saved in contract's storage
    uint price; // by default is private
    string public location;
    
    bytes1 public holder;
    bytes2 public holderBigger;
    bytes3 public holderBiggest;
    //.. up to bytes32

    //arrays
    uint [3] public numbers = [2, 3, 4];

    // can be initialized at declaration or in the constructor only
    address immutable public owner; 
    
    // declaring a constant
    int constant area = 100;
    
    function setElement(uint index, uint value) public {
        numbers[index] = value;
    }

    function getLength() public view returns(uint) {
        return numbers.length;
    }

    function setBytesArray() public {
        holder = 'a';
        holderBigger = 'ab';
        holderBiggest = 'p23';

    }

    // declaring the constructor
    // is executed only once at contract's deployment
    constructor(uint _price, string memory _location){
        price = _price;
        location = _location;
        owner = msg.sender;  // initializing owner to the account's address that deploys the contract
    }
    
    
    // getter function, returns a state variable
    // a function declared `view` does not alter the blockchain 
    function getPrice() public view returns(uint){
        return price;
    }
    
    // setter function, sets a state variable
    function setPrice(uint _price) public{
        int a; // local variable saved on stack
        a = 10;
        price = _price;
    }
    
    function setLocation(string memory _location) public{ //string types must be declared memory or storage
        location = _location;
    }
    
}