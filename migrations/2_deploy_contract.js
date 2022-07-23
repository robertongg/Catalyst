var ContractCreator = artifacts.require("./ContractCreator");

module.exports = function(deployer) {
    deployer.deploy(ContractCreator);
}
