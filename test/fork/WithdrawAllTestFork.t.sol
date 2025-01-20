// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { Fork_Test } from "./Fork.t.sol";
import { WBTCBluechip } from "src/beyondFramework/dca/bluechips/WBTCBluechip.sol";
import { IERC20Upgradeable } from "@openzeppelin/contracts-upgradeable/interfaces/IERC20Upgradeable.sol";

contract WithdrawAllTestFork is Fork_Test {
    address from = payable(address(0xE146928D46b7B3f0b283BFf143fb09AA0eFa209D));
    address payable wBTCBluechipProxyAddress = payable(address(0xCa227Cb6197B57d08888982bfA93619F67B4773A));
    address wBTCBluechipOwner = address(0xE8855828fEC29dc6860A4362BCb386CCf6C0c601);

    address receiver = makeAddr("receiver");

    // function test_withdrawAll() public {
    //     WBTCBluechip wBTCBluechip = WBTCBluechip(wBTCBluechipProxyAddress);
    //     vm.startPrank(from);
    //     wBTCBluechip.withdrawAll(true);
    //     vm.stopPrank();
    // }

    function test_upgradeTo_andWithdrawAll() public {
        WBTCBluechip wBTCBluechip = WBTCBluechip(wBTCBluechipProxyAddress);
        WBTCBluechip newImplementation = new WBTCBluechip();
        (IERC20Upgradeable blueChipToken,) = wBTCBluechip.bluechipTokenInfo();
        uint256 balanceBeforeWithdraw = blueChipToken.balanceOf(wBTCBluechipProxyAddress);
        uint256 receiverBalanceBeforeWithdraw = blueChipToken.balanceOf(receiver);

        vm.startPrank(wBTCBluechipOwner);
        wBTCBluechip.upgradeTo(address(newImplementation));
        wBTCBluechip.withdrawToReceiver(receiver);
        vm.stopPrank();

        uint256 balanceAfterWithdraw = blueChipToken.balanceOf(wBTCBluechipProxyAddress);
        uint256 receiverBalanceAfterWithdraw = blueChipToken.balanceOf(receiver);

        assertEq(balanceAfterWithdraw, 0);
        assertEq(receiverBalanceAfterWithdraw, balanceBeforeWithdraw + receiverBalanceBeforeWithdraw);
    }
}
