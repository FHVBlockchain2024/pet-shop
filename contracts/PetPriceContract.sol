pragma solidity ^0.5.0;

contract PetPriceContract {
    uint petPrice = 0.10 ether;

    function checkPrice(uint value) public returns(bool) {
        if(value == petPrice) {
            return true;
        } else {
            return false;
        }
    }
}