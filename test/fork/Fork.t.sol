// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { Test } from "@forge-std/Test.sol";

/// @notice Common logic needed by all fork tests.
abstract contract Fork_Test is Test {
    function setUp() public virtual {
        vm.createSelectFork({ blockNumber: 56_010_683, urlOrAlias: "avax" });
    }
}
