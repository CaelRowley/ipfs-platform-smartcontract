pragma solidity ^0.5.0;

import "./interfaces/IFileTracker.sol";

contract FileTracker is IFileTracker {

    address owner;

    struct FileData {
        address owner;
        string ipfsHash;
    }

    mapping(uint => FileData) fullFileData;
    uint numberOfFiles = 0;

    event Uploaded(string ipfsHash);

    constructor() public {
        owner = msg.sender;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function upload(string memory ipfsHash) public {
        require(bytes(ipfsHash).length == 46, "incorrect length");
        // require(fullFileData[ipfsHash].owner == address(0x0), "file already uploaded");

        fullFileData[numberOfFiles].owner = msg.sender;
        fullFileData[numberOfFiles].ipfsHash = ipfsHash;

        numberOfFiles++;

        emit Uploaded(ipfsHash);
    }
}
