// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


// Some code...
import "@openzeppelin/contract/token/ERC20/ERC20.sol";

// Some more code...
interface IERC20 {

    function approve(address spender, uint256 amount) external returns (bool);
    
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract exampleContract {
    // Example of an ERC20 token instance
    ERC20 USDTToken = ERC20("0x5c06B3B902A41a19a701979A1F70Ea1B11be5A67");

    // Approve USDT
    uint256 amount = 100*(10 ** 18);

    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }
}