// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

//import Open Zepplins ERC-20 contract
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//create a sample token 
contract MyToken is ERC20 {

    //uint public amountAllowed = 10000000000;

    address public owner;

   //mint token
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
        _mint(msg.sender, 5000 *(10 ** 18));
    }

    function ownwer_name() public view returns (address) {
        return owner;
    }
    
}
