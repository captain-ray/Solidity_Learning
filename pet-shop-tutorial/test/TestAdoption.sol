pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption{
    // The address of the adoption contract to be tested
    Adoption adoption=Adoption(DeployedAddresses.Adoption());

    uint expectedPetId=8;

    address expectedAdopter = address(this);


    //test the adopt() function
    function testUserCanAdoptPet() public{
        uint returnedId = adoption.adopt(expectedPetId);

        Assert.equal(returnedId,expectedPetId,"Adoption of the expected pet should match what is returned.");
    }

    //test retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public{
        address adopter=adoption.adopters(expectedPetId);

        Assert.equal(adopter,expectedAdopter,"owner of the expected pet should be this contract");
    }


    //test retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public{
        // store adopters in memory instead of contract's storage
        address[16] memory adopters=adoption.getAdopters();
        
        //using[], different from the previous one using adoption.adopters()
        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }
}