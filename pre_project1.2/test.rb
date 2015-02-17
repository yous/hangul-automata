다음은 pre_project1.2를 이용해 Me 테스트 케이스를 작성해 보고, 이를 MealyMachineSimulator를 통해 실행해 보는 코드이다.

require 'pre_project1.2/pre_project1.2'

states = ["state0", "state1", "state2"]
symbols = ["symbol1", "symbol2"]
outputs = []
states.each do |state|
  symbols.each do |symbol|
    outputs.push <<-PROGRAM
      puts "#{state.gsub(/state(.*)/, '\1')}, #{symbol.gsub(/symbol(.*)/, '\1')}"
    PROGRAM
  end
end
stateTransition = {
  "state0" => {"symbol1" => "state1", "symbol2" => "state2"},
  "state1" => {"symbol1" => "state2", "symbol2" => "state1"},
  "state2" => {"symbol1" => "state0", "symbol2" => "state2"}
}
stateTransitionFunction = StateTransitionFunction.new(stateTransition)
outputTransition = {
  "state0" => {"symbol1" => "      puts \"0, 1\"\n", "symbol2" => "      puts \"0, 2\"\n"},
  "state1" => {"symbol1" => "      puts \"1, 1\"\n", "symbol2" => "      puts \"1, 2\"\n"},
  "state2" => {"symbol1" => "      puts \"2, 1\"\n", "symbol2" => "      puts \"2, 2\"\n"}
}
outputFunction = OutputFunction.new(outputTransition)
initialState = "state0"

_MealyMachineSimulator = MealyMachineSimulator.new(states, symbols, outputs, stateTransitionFunction, outputFunction, initialState)

_MealyMachineSimulator.run(["symbol1", "symbol2"])
=begin
0, 1
1, 2
=end
_MealyMachineSimulator.run(["symbol2", "symbol1", "symbol1", "symbol1"])
=begin
0, 2
2, 1
0, 1
1, 1
=end

코드를 실행한 결과는 다음과 같다.
0, 1
1, 2
0, 2
2, 1
0, 1
1, 1
