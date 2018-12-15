pragma solidity ^0.4.2;

contract Election {
     // Model a Candidate (what they look like)
     struct Candidate { //this is like creating custom Type (interface)
         uint id;
         string name;
         uint voteCount;
     }
     // Store accounts that have voted
     mapping(address => bool) public voters;

     // Store candidate
     // Fetch candidate 
     mapping(uint => Candidate) public candidates; // an associative array we pass (key - value)
     // Store Candidates Count
    uint public candidatesCount;

    // voted event
    event votedEvent(
        uint indexed _candidateId
    );

    function Election () public {
        addCandidate("Student 1");
        addCandidate("Student 2");
    }

    // privste becsuse we dont want it to be accessible to the public interface of our contract
    // no one else should be able to add a candidate to our mapping / election except our contract
    function addCandidate (string _name) private { 
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0); // this instantiates a new guy of struct type Candidate
    }

// solidity allows us to provide metadata to our functions. i.e 
// you can provide more stuff to a function than is specified in the func's arguments
    function vote (uint _candidateId) public {
        // require that address hasnt voed before
        require(!voters[msg.sender]);
        
        // require that candidate is valid
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        
        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote count
        candidates[_candidateId].voteCount ++; 

        // trigger voted event
        votedEvent(_candidateId);
    }
}