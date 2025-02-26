// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title A simple holder of tokens.
 * This is a simple contract to hold tokens. It's useful in the case where a separate contract
 * needs to hold multiple distinct pools of the same token.
 */
contract TokenPool is Ownable {
    IERC20 public token;

    constructor(IERC20 _token) {
        token = _token;
    }

    function balance() public view returns (uint256) {
        return token.balanceOf(address(this));
    }

    function transfer(address to, uint256 value)
        external
        onlyOwner
        returns (bool)
    {
        return token.transfer(to, value);
    }

    function rescueFunds(
        address tokenToRescue,
        address to,
        uint256 amount
    ) external onlyOwner returns (bool) {
        require(
            address(token) != tokenToRescue,
            "TokenPool: Cannot claim token held by the contract"
        );

        return IERC20(tokenToRescue).transfer(to, amount);
    }
}
