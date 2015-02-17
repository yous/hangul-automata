LANGUAGE
--------
ruby 1.9.3

HOW TO RUN
----------
ruby (-I[library path]) pre_project1.2.rb

ABOUT
-----
MealyMachineSimulator는 Mealy Machine Me = (states, symbols, outputs, stateTransitionFunction, outputFunction, initialState)를 입력받아 생성된다. 이렇게 생성된 MealyMachineSimulator object는 @states, @symbols, @outputs, @stateTransitionFunction, @outputFunction, @initialState에 각각 states, symbols, outputs, stateTransitionFunction, outputFunction, initialState를 저장하고 있고, 임의의 문자열 x에 대해 각 state와 symbol에 대한 output을 실행하는 함수 run을 가지고 있다.

이 때 states는 가능한 state들의 배열, symbols는 가능한 symbol들의 배열, outputs는 가능한 output들의 배열, stateTransitionFunction은 클래스 StateTransitionFunction object, outputFunction은 클래스 OutputFunction object, initialState는 state이다.

StateTransitionFunction은 DFASimulator의 StateTransitionFunction과 동일하다.

OutputFunction은 StateTransitionFunction과 동일한 클래스이다. 현재 state와 현재 symbol을 입력받아 다음 state를 반환하는 함수 transition을 가지고 있고, states X symbols -> output의 relation을 @transition에 가지고 있다. 이 때 @transition은 키가 state고, 값이 {symbol => output} 형태의 맵인 이중 맵 구조({state => {symbol => output}})이다.
