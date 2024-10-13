# Project 60—Blockchain-Enhanced Roaming Contracts: Integrating Smart Contracts for Mobile Networks Operators Service Optimisation

This repo includes the proof-of-concept smart contract created by Sharjil Kazi and Kiko Ilievski as part of our Part IV Project. 

## Implementation 
The contracted is created using Solidity, intended to be deployed to an Ethereum Testnet. The contract lists a single roaming contract, which users can then subscribe to by transferring 1 ETH to the contract. For the next 24 hours, the contract's state will show that the user has an active roaming plan. When 24 hours pass (or the user prematurely cancels their roaming plan), the 1 ETH (minus gas fees) is transferred to the MNO's wallet. 

This implementation is a simplification of the system proposed in our report.
