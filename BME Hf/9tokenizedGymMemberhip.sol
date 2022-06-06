// SPDX-License-Identifier: MIT

// http://home.mit.bme.hu/~ikocsis/BC2019HF/sol/solidity_09.html
// Tokenized gym membership

pragma solidity ^0.8.3;

import "hardhat/console.sol";

contract TokenizedGymMembership {
    address public owner;
    //address[] public members;

    mapping(address => uint[]) public myTokens;
        //itt szeretném tárolni, hogy kihez melyik tokenId-k tartoznak

    uint public tokenIndex = 1;
    uint public tokenDuration;

    struct Token {
        uint tokenId;
        address tokenOwner;
        bool valid;
        bool expired;
        uint mintTimestamp;
        uint startTime;
        uint endTime;
        uint duration;
    }

    Token[] public tokens;

    event EventOwner(address ownerAddress, uint tokenDurationTime);

    constructor(uint _tokenDuration) {
        owner = msg.sender;
        console.log("Owner set to: " , msg.sender);

        tokenDuration = _tokenDuration;
        console.log("Token duration set to: " , tokenDuration);

        Token memory token;
        tokens.push(token);


        emit EventOwner(msg.sender, tokenDuration);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are NOT the owner");
        _;
    }

    event EventMint(uint mintedTokens);

    function mint(uint HowManyTokensDoYouWantToMint) public onlyOwner {

        for (uint i = tokenIndex; i < HowManyTokensDoYouWantToMint + tokenIndex; i++) {

            // initialize an empty struct and then update it
            Token memory token;

            token.tokenId = i;
            token.tokenOwner = owner;
            token.mintTimestamp = block.timestamp;
            token.duration = tokenDuration;

            tokens.push(token);

            //itt kellene bepusholni a mappolt tömbbe a tokenId-kat msg.sender-nek
            myTokens[owner].push(i);

        }

        tokenIndex = HowManyTokensDoYouWantToMint + tokenIndex;

        console.log("Tokens minted now: ", HowManyTokensDoYouWantToMint);
        emit EventMint(HowManyTokensDoYouWantToMint);

        console.log("All minted tokens: ", tokenIndex - 1);
    }

    function getTokenIds(address _address) public view returns(uint[] memory) {
        return myTokens[_address];
    }

    /*
    modifier isMyToken(){
        uint i = myTokens[msg.sender].length;
    }

    modifier isMyTokenValid(){

    }
    */

    function giveToken(address _address, uint _tokenId) public /*isMyToken */{
        //övé a token?
        //ha valid nem adhatja
        delete myTokens[msg.sender][_tokenId - 1];
        myTokens[_address].push(_tokenId);

       tokens[_tokenId].tokenOwner = _address;
    }

    function validate(uint _tokenId) public /* isMyToken isMyTokenValid*/ {
        //van neki valid?
        tokens[_tokenId].startTime = block.timestamp;
        tokens[_tokenId].endTime = block.timestamp + tokens[_tokenId].duration;
        tokens[_tokenId].valid = true;
    }
}
