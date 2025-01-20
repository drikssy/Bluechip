// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import { Script } from "@forge-std/Script.sol";

abstract contract BaseScript is Script {
    /// @dev The address of the transaction broadcaster.
    address internal broadcaster;

    modifier broadcast() {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY"); 
        vm.startBroadcast(deployerKey);
        broadcaster = vm.addr(deployerKey);
        _;
        vm.stopBroadcast();
    }
}
