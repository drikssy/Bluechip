// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { BaseScript } from "script/Base.s.sol";
import { console } from "@forge-std/Script.sol";
import { WBTCBluechip } from "src/beyondFramework/dca/bluechips/WBTCBluechip.sol";

contract UpgradeWBTCBlueChipScript is BaseScript {
    function run() public virtual broadcast {
        address payable wBTCBluechipProxyAddress = payable(address(0xCa227Cb6197B57d08888982bfA93619F67B4773A));

        WBTCBluechip wBTCBluechipProxy = WBTCBluechip(wBTCBluechipProxyAddress);
        // withdraw to receiver
        console.log("Withdraw to receiver");
        // wBTCBluechipProxy.withdrawToReceiver(/* add the receiver address */);
    }
}
