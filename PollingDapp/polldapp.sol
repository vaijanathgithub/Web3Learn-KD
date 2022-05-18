//SPDX-License-Identifier: MIT
// Owner Vaijanath H
pragma solidity ^0.8.7;

//Contract for Pooling dApp
contract pollDapp {
  string public question;
  string[] public options;
  mapping(uint => uint) public voteCount;
  mapping(address => uint) public UserCastedVotes;

    //Constructor to make contract Modular
    constructor (string memory _question, string[] memory _options){
        question = _question;
        options = _options;

    }

    function getOptions() public view returns (string[] memory)
    {
        return options;
    }

    //Function to Cast Vote
    function castVote(uint _optionIndex) public returns(string memory){
         address _caller = msg.sender;
         uint existingVoteCount = voteCount[_optionIndex];
         uint updateVoteCount = existingVoteCount + 1;
        
        //Check User Voted already or not
         uint existingVotesbyUser = UserCastedVotes[_caller];         
         require(existingVotesbyUser == 0,"You already voted once" );

         uint updatedVotesbyUser =  existingVotesbyUser + 1;

         voteCount[_optionIndex] = updateVoteCount;
         UserCastedVotes[_caller] = updatedVotesbyUser;

         return "Congrats, You voted succesfully";

    }

    //To get all the Votecount
    function getVotes(uint _optionIndex) public view returns (uint){
        return voteCount[_optionIndex];
    }



}
