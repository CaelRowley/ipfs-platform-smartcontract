const FileTracker = artifacts.require('../contracts/FileTracker.sol');

contract('FileTracker', (accounts) => {
  var admin = accounts[0];
  var uploader = accounts[1];

  var fileTracker;
  var validIpfsHash = "QmPXgPCzbdviCVJTJxvYCWtMuRWCKRfNRVcSpARHDKFSha"


  beforeEach(async () => {
    fileTracker = await FileTracker.new()
  })

  it("uploads a file and stores a hash", async () => {
    const response = await fileTracker.upload(validIpfsHash, { from: uploader })
    console.log(response.logs[0].args)
    console.log('admin: ' + admin);
    console.log('uploader: ' + uploader);
    assert.equal(response.logs[0].args.ipfsHash, validIpfsHash, 'not correctly uploaded')
  });
});
