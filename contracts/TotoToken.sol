// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract TotoToken is ERC20, AccessControl{
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    event BuyToken(address _buyer, uint256 _amount);
    event SellToken(address _buyer, uint256 _amount);

    constructor(
        string memory tokenName,
        string memory tokenTicker
    ) ERC20(tokenName, tokenTicker){
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function mint(address _to, uint256 _amount) public {
        require(hasRole(MINTER_ROLE, msg.sender), "Caller is not the minter");
        _mint(_to, _amount);
    }

}