# Project 1.2

## Language

ruby 1.9.3

## How to run

``` sh
ruby (-I[library path]) pre_project1.2.rb
```

## About

`MealyMachineSimulator`는 Mealy Machine Me = (states, symbols, outputs, stateTransitionFunction, outputFunction, initialState)를 입력받아 생성된다. 이렇게 생성된 `MealyMachineSimulator` object는 `@states`, `@symbols`, `@outputs`, `@stateTransitionFunction`, `@outputFunction`, `@initialState`에 각각 `states`, `symbols`, `outputs`, `stateTransitionFunction`, `outputFunction`, `initialState`를 저장하고 있고, 임의의 문자열 x에 대해 각 state와 symbol에 대한 output을 실행하는 함수 `run`을 가지고 있다.

이 때 `states`는 가능한 state들의 배열, `symbols`는 가능한 symbol들의 배열, `outputs`는 가능한 output들의 배열, `stateTransitionFunction`은 클래스 `StateTransitionFunction` object, `outputFunction`은 클래스 `OutputFunction` object, `initialState`는 state이다.

`StateTransitionFunction`은 `DFASimulator`의 `StateTransitionFunction`과 동일하다.

`OutputFunction`은 `StateTransitionFunction`과 동일한 클래스이다. 현재 state와 현재 symbol을 입력받아 다음 state를 반환하는 함수 transition을 가지고 있고, states X symbols -> output의 relation을 `@transition`에 가지고 있다. 이 때 `@transition`은 키가 state고, 값이 {symbol => output} 형태의 맵인 이중 맵 구조({state => {symbol => output}})이다.
