var FileTracker = artifacts.require("./FileTracker.sol");

module.exports = (deployer) => {
  deployer.deploy(FileTracker);
};
