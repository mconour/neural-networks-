// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssetTokenization {
    struct Asset {
        uint256 id;
        string name;
        string description;
        uint256 value;
        address owner;
    }

    uint256 private assetCounter = 0;
    mapping(uint256 => Asset) public assets;

    function createAsset(string memory name, string memory description, uint256 value) public {
        // Increment the assetCounter to get a new ID
        assetCounter++;

        // Set the owner of the asset to the sender of the transaction
        address assetOwner = msg.sender;

        // Create a new asset and store it in the mapping
        assets[assetCounter] = Asset(assetCounter, name, description, value, assetOwner);

        // Emit an event here if you want to notify front ends of the asset creation
    }
}
