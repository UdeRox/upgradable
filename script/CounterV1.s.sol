// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {CounterV1} from "../src/CounterV1.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract CounterV1Script is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
    }

    function deployCounterV1() public returns (address) {
        vm.startBroadcast();
        CounterV1 box = new CounterV1();
        ERC1967Proxy proxy = new ERC1967Proxy(address(box), "");
        CounterV1(address(proxy)).initialize();
        vm.stopBroadcast();
        return address(proxy);
    }
}
