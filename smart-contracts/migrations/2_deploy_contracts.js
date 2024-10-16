const BookNFT = artifacts.require("BookNFT");

module.exports = function(deployer) {
  deployer.deploy(BookNFT);
};
