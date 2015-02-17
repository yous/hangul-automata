DFASimulator는 DFA D = (states, symbols, stateTransitionFunction, initialState, finalStates)를 입력받아 생성된다. 이렇게 생성된 DFASimulator object는 @states, @symbols, @stateTransitionFunction, @initialState, @finalStates에 각각 states, symbols, stateTransitionFunction, initialState, finalStates를 저장하고 있고, 임의의 문자열 x에 대해 x가 L(D)에 속하는지 속하지 않는지 출력하는 함수 run을 가지고 있다.

이 때 states는 가능한 state들의 배열, symbols는 가능한 symbol들의 배열, stateTransitionFunction은 클래스 StateTransitionFunction object, initialState는 state, finalStates는 state들의 배열이다.

StateTransitionFunction은 현재 state와 현재 symbol을 입력받아 다음 state를 반환하는 함수 transition을 가지고 있고, states X symbols -> state의 relation을 @transition에 가지고 있다. 이 때 @transition은 키가 state고, 값이 {symbol => state} 형태의 맵인 이중 맵 구조({state => {symbol => state}})이다.

StateTransitionFunction object와 DFASimulator object의 생성 코드는 다음과 같다.

states = ["state0", "state1", "state2"]
symbols = ["symbol1", "symbol2"]
transition = {
  "state0" => {"symbol1" => "state1", "symbol2" => "state2"},
  "state1" => {"symbol1" => "state2", "symbol2" => "state1"},
  "state2" => {"symbol1" => "state0", "symbol2" => "state2"}
}
initialState = "state0"
finalStates = ["state2"]

stfObj = StateTransitionFunction.new(transition)
dfaSimulObj = DFASimulator.new(
  states,
  symbols,
  stfObj,
  initialState,
  finalStates
)