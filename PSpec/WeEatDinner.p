

event eSpec_WeEatDinner_Init;

spec WeEatDinner observes eDinner {
    start state Init {
        on eSpec_WeEatDinner_Init goto WaitForDinner; 
    }

    state WaitForDinner {
        on eDinner do (dinner: string) {
            assert true, "We are having dinner";
        }
    }
}