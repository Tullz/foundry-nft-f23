//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {MoodNft} from "../../src/MoodNft.sol";
import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCI+Cjx0ZXh0IHg9IjAiIHk9IjE1IiBmaWxsPSJyZWQiPkhpISBZb3VyIGJyb3dzZXIgZGVjb2RlZCB0aGlzPC90ZXh0Pgo8L3N2Zz4=";
        string memory svg = vm.readFile("./img/example.svg");
        string memory actualUri = deployer.svgToImageUri(svg);
        assertEq(actualUri, expectedUri);
    }
}
