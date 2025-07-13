# p_small_from_scratch
An attempt to write a p-lang project from scratch

Two machines have a brief conversation with 3 messages total:
Machine Me sends an eProposeDinner to Machine You, and You
echoes it back.  Machine Me then sends an eDinner message to Machine
You.

Spec WeEatDinner is intended to observe that eDinner and assert true
at that observation.  

As of this writing, it compiles with `p compile`,
but then `p check -v`:

```
.. Searching for a P compiled file locally in folder ./PGenerated/
.. Found a P compiled file: ./PGenerated/CSharp/net8.0/EvenSmaller.dll
.. Checking ./PGenerated/CSharp/net8.0/EvenSmaller.dll
.. Test case :: tcTuesday
... Checker is using 'random' strategy (seed:1588780778).
..... Schedule #1
<TestLog> Running test 'tcTuesday'.
<CreateLog> PImplementation.WeEatDinner was created.
<MonitorLog> PImplementation.WeEatDinner enters state 'Init'.
<CreateLog> TestTuesday(1) was created by task '2'.
<StateLog> TestTuesday(1) enters state 'Init'.
<AnnounceLog> 'TestTuesday(1)' announced event 'eSpec_WeEatDinner_Init'.
<CreateLog> You(2) was created by TestTuesday(1).
<StateLog> You(2) enters state 'Init'.
<GotoLog> You(2) is transitioning from state 'Init' to state 'PImplementation.You.WaitForProposal'.
<StateLog> You(2) exits state 'Init'.
<StateLog> You(2) enters state 'WaitForProposal'.
<CreateLog> Me(3) was created by TestTuesday(1).
<StateLog> Me(3) enters state 'Init'.
<PrintLog> Me initialized with You(2)
<SendLog> 'Me(3)' in state 'Init' sent event 'eProposeDinner with payload (<source:Me(3), proposal:"Pizza", >)' to 'You(2)'.
<GotoLog> Me(3) is transitioning from state 'Init' to state 'PImplementation.Me.WaitForCounterProposal'.
<StateLog> Me(3) exits state 'Init'.
<StateLog> Me(3) enters state 'WaitForCounterProposal'.
<DequeueLog> 'You(2)' dequeued event 'eProposeDinner with payload (<source:Me(3), proposal:"Pizza", >)' in state 'WaitForProposal'.
<SendLog> 'You(2)' in state 'WaitForProposal' sent event 'eProposeDinner with payload (<source:Me(3), proposal:"Pizza", >)' to 'Me(3)'.
<DequeueLog> 'Me(3)' dequeued event 'eProposeDinner with payload (<source:Me(3), proposal:"Pizza", >)' in state 'WaitForCounterProposal'.
<PrintLog> Me(3) dines with You(2) on Pizza!
<MonitorLog> WeEatDinner is processing event 'eDinner with payload ("Pizza")' in state 'Init'.
<MonitorLog> PImplementation.WeEatDinner exits state 'Init'.
<ExceptionLog> Me(3) running action 'Anon_4' in state 'WaitForCounterProposal' threw exception 'NullReferenceException'.
<ErrorLog> Exception 'System.NullReferenceException' was thrown in Me(3) (state 'WaitForCounterProposal', action 'Anon_4'): Object reference not set to an instance of an object.
from location 'PCheckerCore':
The stack trace is:
   at PChecker.Runtime.Specifications.Monitor.get_CurrentStateName() in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/Specifications/Monitor.cs:line 137
   at PChecker.Runtime.Specifications.Monitor.get_CurrentStateNameWithTemperature() in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/Specifications/Monitor.cs:line 147
   at PChecker.SystematicTesting.ControlledRuntime.NotifyMonitorError(Monitor monitor) in /home/runner/work/P/P/Src/PChecker/CheckerCore/SystematicTesting/ControlledRuntime.cs:line 1241
   at PChecker.Runtime.Specifications.Monitor.Assert(Boolean predicate, String s, Object[] args) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/Specifications/Monitor.cs:line 297
   at PChecker.Runtime.Specifications.Monitor.HandleEvent(Event e) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/Specifications/Monitor.cs:line 328
   at PChecker.Runtime.Specifications.Monitor.MonitorEvent(Event e, String senderName, String senderType, String senderState) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/Specifications/Monitor.cs:line 309
   at PChecker.SystematicTesting.ControlledRuntime.Monitor(Type type, Event e, String senderName, String senderType, String senderStateName) in /home/runner/work/P/P/Src/PChecker/CheckerCore/SystematicTesting/ControlledRuntime.cs:line 808
   at PChecker.Runtime.StateMachines.StateMachine.Monitor(Type type, Event e) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/StateMachines/StateMachine.cs:line 353
   at PChecker.Runtime.StateMachines.StateMachine.AnnounceInternal(Event ev) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/StateMachines/StateMachine.cs:line 277
   at PChecker.Runtime.StateMachines.StateMachine.SendEvent(PMachineValue target, Event ev) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/StateMachines/StateMachine.cs:line 540
   at PImplementation.Me.Anon_4(Event currentMachine_dequeuedEvent) in /Users/nkerr/Workspace/personal/p_small_from_scratch/PGenerated/CSharp/EvenSmaller.cs:line 203
   at PChecker.Runtime.StateMachines.StateMachine.InvokeActionAsync(CachedDelegate cachedAction, Event e) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/StateMachines/StateMachine.cs:line 718
<StrategyLog> Found bug using 'random' strategy.
Error: Exception 'System.NullReferenceException' was thrown in Me(3) (state 'WaitForCounterProposal', action 'Anon_4'): Object reference not set to an instance of an object.
from location 'PCheckerCore':
The stack trace is:
   at PChecker.Runtime.Specifications.Monitor.get_CurrentStateName() in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/Specifications/Monitor.cs:line 137
   at PChecker.Runtime.Specifications.Monitor.get_CurrentStateNameWithTemperature() in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/Specifications/Monitor.cs:line 147
   at PChecker.SystematicTesting.ControlledRuntime.NotifyMonitorError(Monitor monitor) in /home/runner/work/P/P/Src/PChecker/CheckerCore/SystematicTesting/ControlledRuntime.cs:line 1241
   at PChecker.Runtime.Specifications.Monitor.Assert(Boolean predicate, String s, Object[] args) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/Specifications/Monitor.cs:line 297
   at PChecker.Runtime.Specifications.Monitor.HandleEvent(Event e) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/Specifications/Monitor.cs:line 328
   at PChecker.Runtime.Specifications.Monitor.MonitorEvent(Event e, String senderName, String senderType, String senderState) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/Specifications/Monitor.cs:line 309
   at PChecker.SystematicTesting.ControlledRuntime.Monitor(Type type, Event e, String senderName, String senderType, String senderStateName) in /home/runner/work/P/P/Src/PChecker/CheckerCore/SystematicTesting/ControlledRuntime.cs:line 808
   at PChecker.Runtime.StateMachines.StateMachine.Monitor(Type type, Event e) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/StateMachines/StateMachine.cs:line 353
   at PChecker.Runtime.StateMachines.StateMachine.AnnounceInternal(Event ev) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/StateMachines/StateMachine.cs:line 277
   at PChecker.Runtime.StateMachines.StateMachine.SendEvent(PMachineValue target, Event ev) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/StateMachines/StateMachine.cs:line 540
   at PImplementation.Me.Anon_4(Event currentMachine_dequeuedEvent) in /Users/nkerr/Workspace/personal/p_small_from_scratch/PGenerated/CSharp/EvenSmaller.cs:line 203
   at PChecker.Runtime.StateMachines.StateMachine.InvokeActionAsync(CachedDelegate cachedAction, Event e) in /home/runner/work/P/P/Src/PChecker/CheckerCore/Runtime/StateMachines/StateMachine.cs:line 718
... Emitting verbose logs:
..... Writing PCheckerOutput/BugFinding/EvenSmaller_0_verbose.trace.json
Checker found a bug.
... Emitting traces:
..... Writing PCheckerOutput/BugFinding/EvenSmaller_0_0.trace.json
..... Writing PCheckerOutput/BugFinding/EvenSmaller_0_0.schedule
... Elapsed 0.08 sec and used 0 GB.
... ### Process 0 is terminating
... Emitting coverage report:
..... Writing PCheckerOutput/BugFinding/EvenSmaller.coverage.txt
..... Writing PCheckerOutput/BugFinding/EvenSmaller.sci
... Checking statistics:
..... Found 1 bug.
... Scheduling statistics:
..... Explored 1 schedule
..... Explored 1 timeline
..... Found 100.00% buggy schedules.
..... Number of scheduling points in terminating schedules: 10 (min), 10 (avg), 10 (max).
..... Writing PCheckerOutput/BugFinding/EvenSmaller_pchecker_summary.txt
... Elapsed 0.0891187 sec.
. Done
~~ [PTool]: Thanks for using P! ~~
```

P version 2.3.8.0 on an M2 Pro macbook with macos 15.5.