// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "MyToken.sol";

contract Faucet{

// creat obj
    MyToken fooContract;
    address public urvish = 0x9f477448F1B96edCE91d0e29Aa0A1f4E816C9A5f; // tpken account address
 
    //mapping to keep track of requested rokens
    //Address and blocktime + 1 day is saved in TimeLock
    mapping(address => uint256) public lockTime;
    mapping(address => uint) public withdrawals_balance;

    //constroctur 
    constructor(address fooAddress) {
        fooContract = MyToken(fooAddress);
    }

    //withdraw function
    function withdraw(address to, uint amt) public returns(bool){

        //old uders
        if(lockTime[to] != 0){

            //user come after 24H
            if(lockTime[to] + 1 days <= block.timestamp){
                withdrawals_balance[to] = 0;
            }
          
            require(amt <= 100 - withdrawals_balance[to] , "you can clime only 100 coins in 24H");
            require(fooContract.transferFrom(urvish,to, amt), "Deposit is fall");

            withdrawals_balance[to] = amt;  // update balances
            //update time only after 24H
            if(lockTime[to] + 1 days <= block.timestamp){
                lockTime[to] = block.timestamp;
            }

              
        }
        else{ 
            // new users
            require(amt <=100, "you can clime only 100 coins in 24H");
            //deposit
            require(fooContract.transferFrom(urvish,to, amt), "Deposit is fall");
            //update balances
            withdrawals_balance[to] = amt;
            //update time
            lockTime[to] = block.timestamp;
        }
        
        return true;
    }

}
