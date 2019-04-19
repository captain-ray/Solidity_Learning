pragma solidity ^0.5.0;

contract Adoption{

    //Addresses are Ethereum addresses, stored as 20 byte values.
    address[16] public adopters;

    //adopt a pet
    function adopt(uint petId) public returns (uint){
        //ensure the ID is within range
        require(petId >= 0 && petId <= 15);

        //the address of the person or smart contract who called this function is denoted by msg.sender
        adopters[petId] = msg.sender;
        
        return petId;
    }

    //Retrieving the adopters
    function getAdopters() public view returns (address[16] memory){
        return adopters;
    }
}