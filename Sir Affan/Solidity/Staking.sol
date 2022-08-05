// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;
library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}
interface IERC20Upgradeable {
    event Transfer(address indexed from, address indexed to, uint256 value);
	event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address to, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}


contract staking {
    using SafeMath for uint256;
	struct User_data{
		uint256 amountLocked;
		uint256 claimed;
		uint256 lastReward;
	}

	event Staked(address staker, uint256 lockAmount);
	event UnStaked(address staker, uint256 lockAmount);

	mapping(address => User_data) _staker;
	uint256 _totalLocked;
	uint256 _activeStakers;
	uint256 _apy;
	address _owner;
	IERC20Upgradeable _token1;

	constructor(uint256 apy_, IERC20Upgradeable token_){
		_apy = apy_; // 100 = 1%, 1 = 0.01%
		_token1 = token_;
		_owner = msg.sender;
	}


	function stake(uint256 _amount) external{

		require(_staker[msg.sender].amountLocked == 0, "You are already a staker");
		_token1.transferFrom(msg.sender, address(this),_amount);
		_staker[msg.sender] = User_data(
			_amount,
			0,
			block.timestamp
		);

		_totalLocked += _amount;

		emit Staked(msg.sender, _amount);
	}

	function unStake() external{
		require(_staker[msg.sender].amountLocked > 0, "You are not a staker");
		uint256 amount_ = _staker[msg.sender].amountLocked;
		uint256 reward = claimable(msg.sender);
		_token1.transfer(msg.sender, _staker[msg.sender].amountLocked+reward);
		_staker[msg.sender].amountLocked = 0;

		_totalLocked -= amount_;
		emit UnStaked(msg.sender, amount_);
	}


	function claimable(address _user) public view returns(uint256){
		require(_staker[_user].amountLocked > 0 , "Not Stakers");


		uint256 claimable_days = (block.timestamp - _staker[_user].lastReward).div(1 days);
		uint256 reward_per_day = ((_staker[_user].amountLocked).div(10000) * _apy).div(365);

		return claimable_days.mul(reward_per_day); 
	}

	function redeemRewards() public {
		require(_staker[msg.sender].amountLocked > 0 , "Not Stakers");
		uint256 reward = claimable(msg.sender);
		require(reward < rewardPot(),"RewardPot Is Empty");
		

		_token1.transfer(msg.sender, reward);

		_staker[msg.sender].claimed += reward;
		_staker[msg.sender].lastReward = block.timestamp;


	}

	function rewardPot() public view returns(uint256){
		return (_token1.balanceOf(address(this))- _totalLocked);
	}

}
