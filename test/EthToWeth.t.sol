// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/EthToWeth.sol";

interface ERC20 {
    function balanceOf(address) external view returns (uint);
}

contract EthToWethTest is Test {
    EthToWeth public etw;

    function setUp() public {
        etw = new EthToWeth();
        vm.deal(address(this), 1 ether);
    }

    function testDeposit() public {
        etw.deposit{value: 1 ether}();
        assertEq(ERC20(etw.WETH_ADDRESS()).balanceOf(address(etw)), 1 ether);
    }
}
