pragma solidity ^0.4.2;

contract Election {
     // Model a Candidate (what they look like)
     struct Candidate { //this is like creating custom Type (interface)
         uint id;
         string name;
         uint voteCount;
     }
     // Store candidate
     // Fetch candidate 
     mapping(uint => Candidate) public candidates; // an associative array we pass (key - value)
     // Store Candidates Count
    uint public candidatesCount;

    function Election () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    // privste becsuse we dont want it to be accessible to the public interface of our contract
    // no one else should be able to add a candidate to our mapping / election except our contract
    function addCandidate (string _name) private { 
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0); // this instantiates a new guy of struct type Candidate
    }
}