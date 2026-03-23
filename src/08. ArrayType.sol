// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract ArrayType is IArrayType {
    uint256[] array;

    function initArray() public override {
        for (uint256 i; i < 200; ++i) {
            array.push(i);
        }
    }
}

contract ArrayTypeOptimized is IArrayType {
    uint256[] array;

    function initArray() public override {
        array = new uint256[](200);
        for (uint256 i; i < 200; ) {
            array[i] = i;
            unchecked {
                ++i;
            }
        }
    }
}
