//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    // Max Whitelist places
    uint8 public maxWhitelistedAddresses;

    // Mapping -> set address to true if it's whitelisted. All others false by default.
    mapping(address => bool) public whitelistedAddresses;

    // Counter for already whitelisted addresses
    uint8 public numAddressesWhitelisted;

    // By Deployment user can set the maximum whitelist places
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }


    function addAddressToWhitelist() public {

        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");

        whitelistedAddresses[msg.sender] = true;

        numAddressesWhitelisted += 1;


    }
}