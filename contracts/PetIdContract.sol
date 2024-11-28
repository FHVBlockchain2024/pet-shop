pragma solidity ^0.5.0;

contract PetIdContract {

    function checkPetId(uint value) public returns(bool) {
        if(value >= 0 && value <= 15) {
            return true;
        } else {
            return false;
        }
    }
}