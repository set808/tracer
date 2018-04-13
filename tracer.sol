pragma solidity ^0.4.2;

function createAsset(string name, string description, string uuid, string manufacturer) {
 
    if(assetStore[uuid].initialized) {
        RejectCreate(msg.sender, uuid, "Asset with this UUID already exists.");
        return;
      }
 
      assetStore[uuid] = Asset(name, description, true, manufact);
      walletStore[msg.sender][uuid] = true;
      AssetCreate(msg.sender, uuid, manufact);
}

function transferAsset(address to, string uuid) {
 
    if(!assetStore[uuid].initialized) {
        RejectTransfer(msg.sender, to, uuid, "No asset with this UUID exists");
        return;
    }
 
    if(!walletStore[msg.sender][uuid]) {
        RejectTransfer(msg.sender, to, uuid, "Sender does not own this asset.");
        return;
    }
 
    walletStore[msg.sender][uuid] = false;
    walletStore[to][uuid] = true;
    AssetTransfer(msg.sender, to, uuid);
}