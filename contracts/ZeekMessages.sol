// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeekMessages {
    bytes32[] private messages;

    // Event to acknowledge a new message
    event MessageReceived(string);

    constructor() {
        // Zeek initializes the contract with a welcome message
        emit MessageReceived("Zeek welcomes you to zkSync!");
    }

    // Function to send a "secret" message to Zeek
    function sendMessage(string memory _message) public {
        bytes32 hashedMessage = keccak256(abi.encodePacked(_message));
        messages.push(hashedMessage);

        // Acknowledge the message receipt with Zeek's reply
        emit MessageReceived("ZK is the endgame - Message received!");
    }

    // Function to count the total messages sent to Zeek
    function getTotalMessages() public view returns (uint) {
        return messages.length;
    }

    // Function to return the last message sent to Zeek
    function getLastMessage() public view returns (string memory) {
        require(messages.length > 0, "No messages sent to Zeek yet!");
        return messages[messages.length - 1];
    }
}
