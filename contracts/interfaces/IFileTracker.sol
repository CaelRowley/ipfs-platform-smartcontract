pragma solidity ^0.5.0;

contract IFileTracker {
    function getOwner() public view returns(address);
    function upload(string memory ipfaHash) public;
}