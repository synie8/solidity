// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract BiggingContract {
     //记录每个捐赠者的捐赠金额
     mapping(address => uint256) public _donates;

     address owner;
     struct Donor {
        address addr;
        uint256 amount;
    }
    Donor[3] public topDonors;

    //在设定的日期之内可以捐赠
    uint256 public lockTimestamp ;

     constructor(uint256 _lockTimestamp) {
        owner = msg.sender;
        lockTimestamp = _lockTimestamp;
     }

     modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
     }

     event Donation(address sender, uint256 amount);

     function donate()external  payable  returns (bool) {
        require(msg.value > 0, "amount must be greater than 0");
        require(block.timestamp <= lockTimestamp, "Donation has ended");
        bool isExisting = false;
        uint256 existingIndex;
        // 检查是否已在排行榜中
        for (uint256 i = 0; i < 3; i++) {
            if (topDonors[i].addr == msg.sender) {
                isExisting = true;
                existingIndex = i;
                break;
            }
        }

        _donates[msg.sender]+=msg.value ; 

        uint256 amount = _donates[msg.sender];
        // 插入排序
        uint256 insertPos = 3; 
        for (uint256 i = 0; i < 3; i++) {
            if (amount > topDonors[i].amount ) {
                insertPos = i;
                break;
            }
        }

        if (insertPos < 3) {
            // 如果是已有捐赠者，先移除旧记录
            if (isExisting) {
                for (uint256 j = existingIndex; j < 2; j++) {
                    topDonors[j] = topDonors[j+1];
                }
                topDonors[2] = Donor(address(0), 0);
            }

            // 插入新记录
            for (uint256 j = 2; j > insertPos; j--) {
                topDonors[j] = topDonors[j-1];
            }
            
            topDonors[insertPos] = Donor(msg.sender,amount );
        }


    
        emit Donation(msg.sender, msg.value);   

        return true;
     }
     
     function getDonation(address donater) public view returns (uint256){        
        return _donates[donater];
     }



     function withDraw()external onlyOwner payable  returns (bool) {
        require(address(this).balance>0,"Insufficient Balance");
        payable (msg.sender).transfer(address(this).balance);

        return true;

     }

     function top3()public view   returns (Donor[3] memory  ){
        
        return topDonors;

     }

     receive() external payable {}

     fallback() external payable { }

}