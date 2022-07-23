// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import './CatalystContract.sol';

contract ContractCreator {
    // state
    address[] public contractList;

    function createContract(address trustee, address sponsor, string memory object) public {
        address newContract = address(new CatalystContract(trustee, sponsor, object));
        contractList.push(newContract);
    }

    function getContractList() public view returns (address[] memory) {
        return contractList;
    }
}
