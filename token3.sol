// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

//import Open Zepplins ERC-20 contract
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

//create a sample token 
contract sampleToken is ERC20 {

    //uint public amountAllowed = 10000000000;

   //mint token
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 5000 *(10 ** 18));
    }

    
}

    
