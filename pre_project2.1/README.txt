LANGUAGE
--------
ruby 1.9.3p125 (2012-02-16 revision 34643) [i686-linux]

HOW TO RUN
----------
ruby (-I[library path]) pre_project2.1.rb
ruby (-I[library path]) test.rb

ABOUT
-----
epsilonClosure 함수는 ε-NFA의 stateTransitionFunction과 states를 입력받아 그 states의 ε*를 반환한다.

eNFA_to_mDFA 함수는 ε-NFA의 states, symbols, stateTransitionFunction, initialState, finalStates를 입력받아 그 ε-NFA에 대응하는 minimal state DFA의 states, symbols, stateTransitionFunction, initialState, finalStates를 반환한다.

이 때 states, symbols, stateTransitionFunction, initialState, finalStates는 DFASimulator의 그것과 동일하고, 반환하는 states, symbols, stateTransitionFunction, initialState, finalStates 역시 DFASimulator의 그것과 동일하다.
