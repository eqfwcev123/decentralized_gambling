// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./TotoToken.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/*
interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}
*/


contract TokenSwap {
    string public TOKENSWAP = "TOKENSWAP";
    IERC20 public ercToken;
    address public ercOwner;

    IERC20 public totoToken;
    address public totoOwner;

    constructor(
        address _ercOwner,
        address _totoOwner,
        address _ercToken,
        address _totoToken
    ) {
        require(_ercOwner != address(0), "Owner address cannot be zero");
        require(_totoOwner != address(0), "Owner address cannot be zero");
        require(_ercToken != address(0), "Token address cannot be zero");
        require(_totoToken != address(0), "Token address cannot be zero");
        ercOwner = _ercOwner;
        totoOwner = _totoOwner;
        ercToken = IERC20(_ercToken); // pass address of DaiTokenContract to use the function
        totoToken = IERC20(_totoToken); // pass address of TotoTokenContract to use the function
    }

    function _safeTranferFrom(
        IERC20 _token,
        address _sender,
        address _recipient,
        uint256 _amount
    ) private { 
        // Send _amount from _sender to _recipient
        bool sent = _token.transferFrom(_sender, _recipient, _amount);
        require(sent, "Token transfer failed");
    }

    function swap(uint256 _amount1, uint256 _amount2) public {
        require(msg.sender == ercOwner || msg.sender == totoOwner, "Not authorized owner");
        require(
            ercToken.allowance(ercOwner, address(this)) >= _amount1,
            "DaiToken Allowance is too low"
        );
        require(
            totoToken.allowance(totoOwner, address(this)) >= _amount1,
            "DaiToken Allowance is too low"
        );

        // Transfer Token ercOwner -> totoOwner
        _safeTranferFrom(ercToken, ercOwner, totoOwner, _amount1);
        _safeTranferFrom(totoToken, totoOwner, ercOwner, _amount2);
    }
}