// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract faucet {
	

    //state variable to keep track of owner and amount of ETHER to dispense
    address public owner;
    uint public amountAllowed = 10*(10 ** 18);


    //mapping to keep track of requested rokens
    //Address and blocktime + 1 day is saved in TimeLock
    mapping(address => uint) public lockTime;
    mapping(address => uint256) balances;
    //balances[amountAllowed] = owner;



    //constructor to set the owner
	constructor() payable {
		owner = msg.sender;
	}

    //function modifier
    // modifier onlyOwner {
    //     require(msg.sender == owner, "Only owner can call this function.");
    //     _; 
    // }


    function balanceOf(address tokenOwner) public view returns (uint256) {
        return balances[tokenOwner];
    }


    //function to send tokens from faucet to an address
    function requestTokens(address payable _requestor) public payable {

        //chek condition
        require(block.timestamp > lockTime[msg.sender], "lock time has not expired. Please try again later");
        
        _requestor.transfer(amountAllowed);        
       // time is 1 minutes
        lockTime[msg.sender] = block.timestamp + 1 minutes;
    }
}