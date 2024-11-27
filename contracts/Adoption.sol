pragma solidity ^0.5.0;

contract Adoption {
    address[16] public adopters;
    uint petPrice = 0.10 ether;

    function adopt(uint petId) public payable returns(uint) {
        
        require(petId >= 0 && petId <= 15);

        require(msg.value == petPrice, "Insufficient payment: 0.01 ETH required");

        adopters[petId] = msg.sender;

        return petId;
    }

    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}