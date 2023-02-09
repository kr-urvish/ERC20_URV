// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

//import "remix_tests.sol";
// import "../contracts/MyToken.sol";
import "MyToken.sol";

contract Faucet{

// creat obj
    MyToken fooContract;
    address public urvish = 0x9f477448F1B96edCE91d0e29Aa0A1f4E816C9A5f;
    address public owner;


    constructor(address fooAddress) {
        fooContract = MyToken(fooAddress);
        owner = urvish;
    }

    //address public new_owner = msg.sender;
     address public xyz = address(this);


    // function approveStakingPoolOnFoo(address faucetAdd, uint256 amount) public returns(bool) {
    //     require(fooContract.approve(faucetAdd,amount),
    //         "approveOnFoo:approval failed");
    //     return true;
    // }


    mapping ( address => uint256 ) public balances;
    
    uint256 amt = 100*(10**18);

    function deposit(address to) public returns(bool){

        // add the deposited tokens into existing balance 
       // balances[msg.sender]+= amt;

        // transfer the tokens from the sender to this contract
        require(fooContract.transferFrom(urvish,to, amt),
                    "Deposit is fall");

        return true;
    }


}