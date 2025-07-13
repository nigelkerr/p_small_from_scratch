
// Test driver that checks the system with a single Client.
machine TestTuesday
{
  start state Init {
    entry {
      // since client
      SetupSitch();
    }
  }
}


// setup the client server system with one bank server and `numClients` clients.
fun SetupSitch()
{
  var you: You;
  var me: Me;

  announce eSpec_WeEatDinner_Init;

  you = new You();
  me = new Me(you);


}