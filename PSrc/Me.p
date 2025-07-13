
event eProposeDinner : (source: Me, proposal: string);
event eDinner : string;

machine Me {
    var you: You;

    start state Init {
	    entry (yous: You) {
            you = yous;
            print format ("Me initialized with {0}", you);

            send you, eProposeDinner, (source= this, proposal= "Pizza");
            goto WaitForCounterProposal;
        }
    }

    state WaitForCounterProposal {
        on eProposeDinner do (input: (source: Me, proposal: string)) {
            // Me receives a counter proposal.
            print format("{0} dines with {1} on {2}!", this, you, input.proposal);
            send you, eDinner, (input.proposal);
        }
    }

}
