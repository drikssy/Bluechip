// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { BaseScript } from "script/Base.s.sol";
import { console } from "@forge-std/Script.sol";
import { WBTCBluechip } from "src/beyondFramework/dca/bluechips/WBTCBluechip.sol";

contract UpgradeWBTCBlueChipScript is BaseScript {
    function run() public virtual broadcast {
        address payable wBTCBluechipProxyAddress = payable(address(0xCa227Cb6197B57d08888982bfA93619F67B4773A));

        WBTCBluechip wBTCBluechipProxy = WBTCBluechip(wBTCBluechipProxyAddress);
        WBTCBluechip newImplementation = new WBTCBluechip();
        console.log("new WBTCBluechip Implementation address deployed at: %s", address(newImplementation));

        console.log("Upgrading WBTCBluechip contract");
        wBTCBluechipProxy.upgradeTo(address(newImplementation));
        console.log("WBTCBluechip contract upgraded to new implementation");
        console.log("WBTCBluechip proxy still at address: %s", address(wBTCBluechipProxy));
    }
}
