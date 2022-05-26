// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./TotoToken.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DashBoard {
    // uesrAddress => bettingAmount
    mapping(address => uint256) public betAmount;
    // userAddress => isBetting
    mapping(address => bool) public isBetting;
    // userAddress => timestamp<uint256>
    //// note: User betting start time
    mapping(address => uint256) public startTime;

    IERC20 public TotoToken;
    IERC20 public DaiToken;

    string public name = "TotoContract";
    
    //// note: Event called when user bets a game
    event Bet(address indexed from, uint256 amount);
    //// note: Event called when user cancels a bet
    event Cancel(address indexed from);
    //// note: Event called when Betting is completed
    event Complete();

    constructor(
        IERC20 _totoToken
    ){
        TotoToken = _totoToken;
    }

    function addBet(uint256 _amount) public {}

    function cancelBet() public {}

}