// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract RomanNumber{
     struct Roman {
           uint256 value ;
           string symbol ;
        }

    mapping(bytes1 => int256) public romanMap;    
    
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

        romanMap['I'] = 1;
        romanMap['V'] = 5;
        romanMap['X'] = 10;
        romanMap['L'] = 50;
        romanMap['C'] = 100;
        romanMap['D'] = 500;
        romanMap['M'] = 1000;

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

    function toInt(string memory s) public view  returns(int256 ) {
        int256 rs=0;
        bytes memory b = bytes(s);
        uint n = b.length;

        for(uint i=0;i<n;i++){
            if(i<n-1 && romanMap[b[i]]<romanMap[b[i+1]]){
                rs -= romanMap[b[i]];
            }else{
                rs += romanMap[b[i]];
            }
        }


        return rs;

    }

}