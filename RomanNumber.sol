// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract RomanNumber{
     struct Roman {
           uint256 value ;
           string symbol ;
        }
    
    // 正确声明动态数组
    Roman[] public romanNumbers;

    constructor() {
        romanNumbers.push(Roman(1000, "M"));
        romanNumbers.push(Roman(900, "CM"));
        romanNumbers.push(Roman(500, "D"));
        romanNumbers.push(Roman(400, "CD"));
        romanNumbers.push(Roman(100, "C"));
        romanNumbers.push(Roman(90, "XC"));
        romanNumbers.push(Roman(50, "L"));
        romanNumbers.push(Roman(40, "XL"));
        romanNumbers.push(Roman(10, "X"));
        romanNumbers.push(Roman(9, "IX"));
        romanNumbers.push(Roman(5, "V"));
        romanNumbers.push(Roman(4, "IV"));
        romanNumbers.push(Roman(1, "I"));
    }

    function toRoman(uint256 num) public view  returns(string memory) {
        string memory res;
        uint256 remaining = num;
        for(uint i=0;i<romanNumbers.length;i++){
            while (remaining>=romanNumbers[i].value) {
            
                remaining-=romanNumbers[i].value;
                res = string(abi.encodePacked(res, romanNumbers[i].symbol));
            }    
            if(remaining==0) break;
        }

        return res;
    }
}