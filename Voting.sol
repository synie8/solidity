// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Voting{

    mapping(address => uint256) public votes;
    address[] public candidates;

    function vote(address  per, uint256 num) public  {
        require(num > 0, "Vote count must be positive");

        votes[per]+=num ;
        candidates.push(per);
    }    

    function getVotes(address per)public view returns ( uint256){
        return votes[per];
    }

    function resetVotes()public {
        for(uint256 i=0;i<candidates.length;i++){
            votes[candidates[i]]=0;
        }
    }

}