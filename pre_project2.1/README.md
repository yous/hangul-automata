# Project 2.1

## Language

ruby 1.9.3p125 (2012-02-16 revision 34643) [i686-linux]

## How to run

``` sh
ruby (-I[library path]) pre_project2.1.rb
ruby (-I[library path]) test.rb
```

## About

`epsilonClosure` 함수는 ε-NFA의 `stateTransitionFunction`과 `states`를 입력받아 그 `states`의 ε*를 반환한다.

`eNFA_to_mDFA` 함수는 ε-NFA의 `states`, `symbols`, `stateTransitionFunction`, `initialState`, `finalStates`를 입력받아 그 ε-NFA에 대응하는 minimal state DFA의 `states`, `symbols`, `stateTransitionFunction`, `initialState`, `finalStates`를 반환한다.

이 때 `states`, `symbols`, `stateTransitionFunction`, `initialState`, `finalStates`는 `DFASimulator`의 그것과 동일하고, 반환하는 `states`, `symbols`, `stateTransitionFunction`, `initialState`, `finalStates` 역시 `DFASimulator`의 그것과 동일하다.
