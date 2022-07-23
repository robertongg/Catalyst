const CatalystContract = artifacts.require("CatalystContract");
const ContractCreator = artifacts.require("ContractCreator");

let contractCreator;
let contractAddress;
let contracts;

before(async() => {
    contractCreator = await ContractCreator.new();

    var trustee = "0x001d3f1ef827552ae1114027bd3ecf1f086ba0f9";
    var sponsor = "0x001d3f1ef827552ae1114027bd3ecf1f086ba100";
    var object = "art drawing";

    await contractCreator.createContract(trustee, sponsor, object);
    contractAddress = await contractCreator.getContractList.call();
    contract = await CatalystContract.at(contractAddress[0]);
});

contract("CatalystsContract test", (accounts) => {
    it("contract has address", async() => {
        assert.ok(contractAddress);
    });
    it("contract has trustee wallet", async() => {
        var trustee = await contract.getTrustee.call();
        assert.ok(trustee);
    });
    it("contract has sponsor wallet", async() => {
        var sponsor = await contract.getSponsor.call();
        assert.ok(sponsor);
    });
    it("contract has sponsor object", async() => {
        var object = await contract.getObject.call();
        assert.ok(object);
    });
    it("allows donors to donate", async() => {
        var donation = "5000000";
        await contract.donate({from: accounts[0], value: donation});
        var amount = await contract.getDonorAmount(accounts[0]);
        assert.equal(amount, donation);
    });
});
