// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "./Owned.sol";
import "./FixedSupplyToken.sol";

contract Exchange is Owned {

    struct Token {
        string symbolName;
        address tokenContract;

        mapping (uint => OrderBook) buyBook;
        uint curBuyPrice;
        uint lowestBuyPrice;
        uint amountBuyPrices;

        mapping (uint => OrderBook) sellBook;
        uint curSellPrice;
        uint lowestSellPrice;
        uint amountSellPrices;
    }

    struct Offer {
        uint amount;
        address who;
    }

    struct OrderBook {
        uint higherPrice;
        uint lowerPrice;

        mapping (uint => Offer) offers;

        uint offers_key;
        uint offers_length;
    }

    mapping (uint8 => Token) tokens;
    uint8 symbolNameIndex;

    mapping (address => mapping (uint => uint)) tokenBalanceForAddress;
    mapping (address => uint) balanceEthForAddress;

    constructor() {
        //owner = msg.sender;
    }

    // modifier onlyOwner() {
    //     require(msg.sender == owner, "not an owner!");
    //     _;
    // }
    
    function depositEther() public payable {
        require(balanceEthForAddress[msg.sender] + msg.value >= balanceEthForAddress[msg.sender]);
        balanceEthForAddress[msg.sender] += msg.value;
    }

    function withdrawEther(uint amountInWei) public {
        require(balanceEthForAddress[msg.sender] >= amountInWei);
        require(balanceEthForAddress[msg.sender] - amountInWei <= balanceEthForAddress[msg.sender]);
        balanceEthForAddress[msg.sender] -= amountInWei;
        payable(msg.sender).transfer(amountInWei);
    }

    function getEthBalanceInWei() public view returns (uint) {
        return balanceEthForAddress[msg.sender];
    }

    function depositToken(string memory symbolName, uint amount) public {
        //require(symbolNameIndex + 1 > symbolNameIndex);
        //symbolNameIndex++;
        //tokens[symbolNameIndex] = Token(symbolName);
        //require(tokenBalanceForAddress[msg.sender][symbolNameIndex] + amount >= tokenBalanceForAddress[msg.sender][symbolNameIndex]);
        //tokenBalanceForAddress[msg.sender][symbolNameIndex] += amount;
    }

    function withdrawToken(string memory symbolName, uint amount) public {
        //uint8 tokenIndex = getSymbolIndexOrThrow(symbolName);
        //require(tokenBalanceForAddress[msg.sender][tokenIndex] >= amount);
        //require(tokenBalanceForAddress[msg.sender][tokenIndex] - amount <= tokenBalanceForAddress[msg.sender][tokenIndex]);
        //tokenBalanceForAddress[msg.sender][tokenIndex] -= amount;
    }

    function getBalance(string memory symbolName) public view returns (uint) {
        //uint8 tokenIndex = getSymbolIndexOrThrow(symbolName);
        //return tokenBalanceForAddress[msg.sender][tokenIndex];
    }

    function addToken(string memory symbolName, address erc20TokenAddress) public onlyOwner {
        //require(symbolNameIndex + 1 > symbolNameIndex);
        require(!hasToken(symbolName));
        symbolNameIndex++;
        tokens[symbolNameIndex].symbolName = symbolName;
        tokens[symbolNameIndex].tokenContract = erc20TokenAddress;
        //tokens[symbolNameIndex] = Token(symbolName, erc20TokenAddress);
    }

    function hasToken(string memory symbolName) public view returns (bool) {
        uint8 tokenIndex = getSymbolIndex(symbolName);
        if (tokenIndex == 0) {
           return false;
        }
        return true;
    }

    function getSymbolIndex(string memory symbolName) internal view returns (uint8) {
        for (uint8 i = 1; i <= symbolNameIndex; i++) {
           if (stringsEqual(tokens[i].symbolName, symbolName)) {
               return i;
           }
        }
        return 0;
    }

    function stringsEqual(string memory _a, string memory _b) internal pure returns (bool) {
        //return keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_b));
        bytes memory a = bytes(_a);
        bytes memory b = bytes(_b);
        if (a.length != b.length) {
            return false;
        }
        for (uint i = 0; i < a.length; i++) {
            if (a[i] != b[i]) {
                return false;
            }
        }
        return true;

    }

    function getBuyOrderBook(string memory symbolName) public view returns (uint[] memory, uint[] memory) {
        //uint8 tokenIndex = getSymbolIndexOrThrow(symbolName);
        //return (0, 0);
    }

    function getSellOrderBook(string memory symbolName) public view returns (uint[] memory, uint[] memory) {
        //uint8 tokenIndex = getSymbolIndexOrThrow(symbolName);
        //return (0, 0);
    }

    function buyToken(string memory symbolName, uint priceInWei, uint amount) public {
        //uint8 tokenIndex = getSymbolIndexOrThrow(symbolName);
    }

    function sellToken(string memory symbolName, uint priceInWei, uint amount) public {
        //uint8 tokenIndex = getSymbolIndexOrThrow(symbolName);
    }

    function cancelOrder(string memory symbolName, bool isSellOrder, uint priceInWei, uint offerKey) public {
        //uint8 tokenIndex = getSymbolIndexOrThrow(symbolName);
    }
    
    function getOwner() public view returns (address) {
        //return owner;
    }
}