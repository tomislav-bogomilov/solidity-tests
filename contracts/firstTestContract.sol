
// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Property {
    // state variable
    int public state;

    function setState(int _state) public {
        state = _state;
    }
}