pragma solidity 0.6.11;
pragma experimental ABIEncoderV2;
import "../lib/Structs.sol";


interface IStakeManager {
    function init (address _schAddress, address _voteManagerAddress,
    address _blockManagerAddress, address _stateManagerAddress) external;

    function setStakerStake(uint256 _id, uint256 _stake, string calldata _reason, uint256 _epoch) external;
    function setStakerEpochLastRevealed(uint256 _id, uint256 _epochLastRevealed) external;
    function updateCommitmentEpoch(uint256 stakerId) external;
    function stake (uint256 epoch, uint256 amount) external;
    function unstake (uint256 epoch) external;
    function withdraw (uint256 epoch) external;
    function givePenalties (uint256 stakerId, uint256 epoch) external;
    function giveBlockReward(uint256 stakerId, uint256 epoch) external;
    function giveRewards (uint256 stakerId, uint256 epoch) external;
    function slash (uint256 id, address bountyHunter, uint256 epoch) external;
    // function calculateInactivityPenalties(uint256 epochs, uint256 stakeValue) public pure returns(uint256);
    function getStakerId(address _address) external view returns(uint256);
    function getStaker(uint256 _id) external view returns(Structs.Staker memory staker);
    function getNumStakers() external view returns(uint256);
    function getRewardPool() external view returns(uint256);
    function getStakeGettingReward() external view returns(uint256);

}
