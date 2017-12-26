pragma solidity ^0.4.7;

contract PiggyBank {

    address creator;
    uint deposits;

    // Declares this function as public makes it accessible to other users ans smart contracts
    function PiggyBank() public {
        creator = msg.sender;
        deposits = 0;
    }

    // Check whether any ether has been deposited. When it is deposited, the number of deposits go up and the total count is returned
    function deposit() public payable returns (uint) {
        if (msg.value > 0)
            deposits += 1;
        return getNumberOfDeposits(); 
    }

    function getNumberOfDeposits() public constant returns (uint) {
        return deposits;
    }

    // When the external account that instantiated this contract calls it again, it terminates and sends back its balance
    function kill() public {
        if (msg.sender == creator)
            selfdestruct(creator);
    }

}