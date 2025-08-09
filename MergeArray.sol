// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MergeArray{

    function merge(uint[] memory a ,uint[] memory b) public pure returns (uint[] memory){
        uint[] memory result = new uint[](a.length+b.length);
        uint  i = 0;
        uint  j = 0;
        uint k = 0;

        while(i < a.length && j < b.length ){
            if(a[i] <=b[j]){
               result[k++] = a[i++];
            }else{
               result[k++] = b[j++];
            }
        }
        while(i < a.length ){
            result[k++] = a[i++];
        }
        while(j < b.length){
            result[k++] = b[j++];
        }
        return result;
    }

    function binarySearch(uint256[] memory arr ,uint256 target)public pure returns(int256){
        int256 index = -1;

        uint256 low = 0;
        uint256 mid = 0;
        uint256 hight = arr.length - 1;
        //升序
        while(low<=hight){
            mid = low + ( hight - low )/2;
            if(target==arr[mid]){
                index = int256(mid);
            }else if(arr[mid]<target){
                low =mid+1;
            }else{
                hight = mid-1;
            }
        }

        return index;
    }
}