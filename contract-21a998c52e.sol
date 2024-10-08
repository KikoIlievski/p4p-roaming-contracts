// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract DataRoamingContract {

    // Mapping to track user-MNO relationships
    mapping(address => address) public userMnoRelation;

    // Mapping to track if a user has data access
    mapping(address => bool) public hasDataAccess;

    // Mapping to track when the roaming started
    mapping(address => uint256) public roamingStartTime;

    /// Only MNO allowed
    error onlyMnoAllowed();

    constructor() {
        // Any initial setup can be done here
    }

    // Function to start roaming, requires 1 ether payment
    function startRoaming(address mno) external payable {
        require(msg.value == 1 ether, "Must send exactly 1 ether to start roaming");

        userMnoRelation[msg.sender] = mno;
        hasDataAccess[msg.sender] = true;
        roamingStartTime[msg.sender] = block.timestamp;
    }

    // Function to check if roaming period is over and transfer the ether to the MNO
    function endRoaming() external {
        require(hasDataAccess[msg.sender], "No active roaming");

        uint256 startTime = roamingStartTime[msg.sender];
        require(block.timestamp >= startTime + 30 seconds, "Roaming period not over");

        address mno = userMnoRelation[msg.sender];
        if (mno == address(0)) {
            revert onlyMnoAllowed();
        }

        hasDataAccess[msg.sender] = false;

        // Transfer the held ether to the MNO
        payable(mno).transfer(1 ether);
    }
}
