pragma solidity 0.5.7;
import "openzeppelin-solidity/contracts/math/SafeMath.sol";


library Random {
    using SafeMath for uint256;

    // pseudo random number generator based on block hashes. returns 0 -> max-1
    function prng (uint8 numBlocks, uint256 max, bytes32 seed) public view returns (uint256) {
        bytes32 hashh = prngHash(numBlocks, seed);
        uint256 sum = uint256(hashh);
        return(sum.mod(max));
    }

    // pseudo random hash generator based on block hashes.
    function prngHash (uint8 numBlocks, bytes32 seed) public view returns(bytes32) {
        bytes32 sum;
        uint256 blockNumberEpochStart = (block.number.div(16)).mul(16);
        for (uint8 i = 1; i <= numBlocks; i++) {
            sum = keccak256(abi.encodePacked(sum, blockhash(blockNumberEpochStart.sub(i))));
        }
        sum = keccak256(abi.encodePacked(sum, seed));
        return(sum);
    }
}