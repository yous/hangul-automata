require 'pre_project1.1/pre_project1.1'

class OutputFunction < StateTransitionFunction
end

class MealyMachineSimulator
  def initialize(states, symbols, outputs, stateTransitionFunction, outputFunction, initialState)
    @states = states
    @symbols = symbols
    @outputs = outputs
    @stateTransitionFunction = stateTransitionFunction
    @outputFunction = outputFunction
    @initialState = initialState
  end

  def run(string)
    state = @initialState
    string.each do |symbol|
      break if not DFASimulator.new(@states, @symbols, @stateTransitionFunction, state, @states).run([symbol])
      output = @outputFunction.transition(state, symbol)
      (@outputs.include? output) ? (output.call state, symbol) : break
      state = @stateTransitionFunction.transition(state, symbol)
    end
  end
end
