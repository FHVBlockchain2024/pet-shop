pragma solidity ^0.5.0;

import "./PetPriceContract.sol";
import "./PetIdContract.sol";

contract Adoption {
    address[16] public adopters;
    uint petPrice = 0.10 ether;

    PetPriceContract public priceContract; 
    PetIdContract public petIdContract;

    constructor(address _priceContractAddress, address _petIdContract) public {
        priceContract = PetPriceContract(_priceContractAddress);
        petIdContract = PetIdContract(_petIdContract);
    }

    function adopt(uint petId) public payable returns(uint) {
        
        // require(petId >= 0 && petId <= 15);
        require(petIdContract.checkPetId(petId), "Wrong Pet Id");

        // require(msg.value == petPrice, "Insufficient payment: 0.01 ETH required");
        require(priceContract.checkPrice(msg.value), "Wrong amount");

        adopters[petId] = msg.sender;

        return petId;
    }

    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}