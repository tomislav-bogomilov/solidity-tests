//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;
 
contract Tinker {

    // executed only once at contract's deployment
    constructor(uint _price, string memory _location){
        price = _price;
        location = _location;
        owner = msg.sender;  // initializing owner to the account's address that deploys the contract
    }

    /* tinkering with string and bytes */
    uint price; // by default is private
    string public location;

    bytes public bytesString = 'can be changed';
    string public regularString = 'cannot be changes';

    function addToString() public {
        bytesString  = abi.encodePacked(bytesString, 'xaaa');
        // regularString.push('x'); - results in error
    }

    function getStringFromBytes() public view returns(string memory) {
        return bytes(bytesString).length > 0 ? string(abi.encodePacked("The byte array is: ", bytesString)) : "Empty Byte Array";
    }

    function getElementFromBytes(uint i) public view returns(bytes1) {
        return bytesString[i];
    }

    /* end of tinkering with string and bytes */


    /** arrays **/

    //.. up to bytes32
    bytes1 public holder;
    bytes2 public holderBigger;
    bytes3 public holderBiggest;

   function setBytesArray() public {
        holder = 'a';
        holderBigger = 'ab';
        holderBiggest = 'p23';
    }

    // fixed array
    uint [3] public numbers = [2, 3, 4];

    /** dynamic arrays **/
    uint[] public dynamicNumbers; // has: .length .push .pop members
     function getDynamicLength() public view returns(uint){
        return dynamicNumbers.length;
    }
    // appending a new element
    function addDynamicElement(uint item) public{
        dynamicNumbers.push(item);
    }
    // returning an element at an index
    function getDynamicElement(uint i) public view returns(uint){
        if(i < dynamicNumbers.length){
            return dynamicNumbers[i];
        }

        return 0;
    }

    // removing the last element of the array
    function popDynamicElement() public{
        dynamicNumbers.pop();
    }

    function initDynamicArray() public{
        // declaring a memory dynamic array
        // it's not possible to resize memory arrays (push() and pop() are not available).
        uint[] memory memoryArray = new uint[](3);
        memoryArray[0] = 10;
        memoryArray[1] = 20;
        memoryArray[2] = 30;
        dynamicNumbers = memoryArray;
    }
 

    /** end of dynamic arrays **/

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