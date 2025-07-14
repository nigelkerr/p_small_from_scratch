
machine You {


    start state Init {
        entry {
            goto WaitForProposal;
        }
    }

    state WaitForProposal {

        on eDinner do (dinner: string) {
            print format ("Yay We are having {0} for dinner!", dinner);
        }
    }
}
