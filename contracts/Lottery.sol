// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./TotoToken.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract Lottery {
    using Counters for Counters.Counter;
    Counters.Counter internal lotteryUserCount;

    string public constant lottery = "LOTTERY";
    IERC20 public totoToken;
    address public manager;
    address payable[] public players;
    uint256 public lotteryId;
    mapping (uint256 => address payable) public lotteryRecord;

    enum LOTTERY_STATE { OPEN, CLOSED, INPROCESS}
    
    event Open();
    event Enter();
    event Claim();

    modifier isManager {
        require(msg.sender == manager, "msg.sender is not manager");
        _;
    }

    constructor(){}

    function open() external isManager{}

    function enter() external {}

    function claim() external {}
    
}