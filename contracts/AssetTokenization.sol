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
        assetCounter++; // Increment the asset counter to get a new ID
        address assetOwner = msg.sender; // Owner of the asset is the sender of the transaction
        assets[assetCounter] = Asset(assetCounter, name, description, value, assetOwner); // Store the new asset
    }

    function assignOwnership(uint256 assetId, address newOwner) public {
        require(assets[assetId].id != 0, "Asset does not exist.");
        require(assets[assetId].owner == msg.sender, "Caller is not the owner.");
        assets[assetId].owner = newOwner; // Update the owner of the asset
    }

    function viewAsset(uint256 assetId) public view returns (Asset memory) {
        require(assets[assetId].id != 0, "Asset does not exist.");
        return assets[assetId]; // Return the asset details
    }
}
