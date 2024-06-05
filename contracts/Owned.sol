// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not an owner!");
        _;
    }

    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    function owned () public{
        owner = msg.sender;
    }
}