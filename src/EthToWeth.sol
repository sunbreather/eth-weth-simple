// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract EthToWeth {
    address public constant WETH_ADDRESS = 0xD0dF82dE051244f04BfF3A8bB1f62E1cD39eED92;

    function deposit() external payable {
        (bool success,) = WETH_ADDRESS.call{value: msg.value}(abi.encodeWithSignature("deposit()"));
        require(success, "Deposit failed");
    }

}
