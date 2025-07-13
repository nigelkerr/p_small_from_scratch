
machine You {


    start state Init {
        entry {
            goto WaitForProposal;
        }
    }

    state WaitForProposal {
        on eProposeDinner do (input: (source: Me, proposal: string)) {
            send input.source, eProposeDinner, (source= input.source, proposal= input.proposal);
        }

        on eDinner do (dinner: string) {
            print format ("Yay We are having {0} for dinner!", dinner);
        }
    }
}
