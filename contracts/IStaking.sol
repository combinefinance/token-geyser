// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

/**
 * @title Staking interface, as defined by EIP-900.
 * @dev https://github.com/ethereum/EIPs/blob/master/EIPS/eip-900.md
 */
abstract contract IStaking {
    event Staked(
        address indexed user,
        uint256 amount,
        uint256 total,
        bytes data
    );
    event Unstaked(
        address indexed user,
        uint256 amount,
        uint256 total,
        bytes data
    );

    function stake(uint256 amount) virtual external;

    function stakeFor(
        address user,
        uint256 amount
    ) virtual external;

    function unstake(uint256 amount) virtual external;

    function totalStakedFor(address addr) virtual public view returns (uint256);

    function totalStaked() virtual public view returns (uint256);

    function token() virtual external view returns (address);

    /**
     * @return False. This application does not support staking history.
     */
    function supportsHistory() virtual external pure returns (bool) {
        return false;
    }
}
