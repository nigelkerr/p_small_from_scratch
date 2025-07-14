
event eDinner : string;

machine Me {
    var you: You;

    start state Init {
	    entry (yous: You) {
            you = yous;
            print format ("Me initialized with {0}", you);

            send you, eDinner, "Pizza";
            goto WaitAround;
        }
    }

    state WaitAround {
        on eDinner do (input: string) {
            print format("{0} is waiting around for {1} to respond with a counter proposal.", this, you);
        }
    }


}
