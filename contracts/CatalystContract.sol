// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CatalystContract {
    // store
	address private trustee;
	address private sponsor;
	string private object;
	mapping(address=>uint) private donorsList;
	
	// constructor
	constructor(address trusteeWallet, address sponsorWallet, string memory sponsorObject) {
		trustee = trusteeWallet;
		sponsor = sponsorWallet;
		object = sponsorObject;
	}
	
	// functions
	function getTrustee() public view returns (address) {
		return trustee;
	}
	
	function getSponsor() public view returns (address) {
		return sponsor;
	}
	
	function getObject() public view returns (string memory) {
		return object;
	}
	
	function setObject(string memory sponsorObject) public {
		object = sponsorObject;
	}

	function getDonorAmount(address donor) public view returns (uint) {
		return donorsList[donor];
	}

	function getTotalAmount() public view returns (uint) {
		return address(this).balance;
	}
	
	function donate() public payable {
		donorsList[msg.sender] = msg.value;
		// payable(msg.sender).transfer(msg.value);
	}

    function withdraw() public {
        // require(msg.sender==trustee);
        payable(trustee).transfer(address(this).balance);
	}
}
