// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ReverseString{

    function reverseString(string memory str)public pure returns(string memory res){
        bytes memory bstr = bytes(str);
        uint length = bstr.length;
        bytes memory temp = new bytes(length);
        for(uint256 i=0; i < length; i++){
            temp[i] = bstr[length - i - 1];
        }
        res = string(temp);
        return res;
    }

}