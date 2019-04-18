//specify solidity version
pragma solidity >=0.4.22 <0.6.0;

contract Counter{
    // unsigned int
    uint num;

    //declare as public
    constructor() public{
        num=0;
    }

    function increment() public{
        num+=1;
    }

    //view--only for read
    function getNum() view public returns (uint) {
        return num;
    }
}

