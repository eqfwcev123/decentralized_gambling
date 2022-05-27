// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";

contract RandomNumber is VRFConsumerBaseV2 {
    VRFCoordinatorV2Interface COORDINATOR;
    bytes32 internal keyHash; // identifies which Chainlink oracle to use
    uint256 internal fee;     // fee to get a random number (LINK)
    uint64 internal subscriptionId;
    uint32 numWords = 6;
    uint256 public randomResult;

    // Rinkeby Testnet
    address internal vrfCoordinator = 0x6168499c0cFfCaCD319c818142124B7A15E857ab;
    address internal owner;

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    constructor(uint64 _subscriptionId) VRFConsumerBaseV2(vrfCoordinator) {
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        owner = msg.sender;
        subscriptionId  = _subscriptionId;
    }


}