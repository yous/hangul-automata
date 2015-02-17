class StateTransitionFunction
  def initialize(transition)
    @transition = transition
  end

  def transition(state, symbol)
    @transition[state][symbol] if @transition[state]
  end
end

class DFASimulator
  def initialize(states, symbols, stateTransitionFunction, initialState, finalStates)
    @states = states
    @symbols = symbols
    @stateTransitionFunction = stateTransitionFunction
    @initialState = initialState
    @finalStates = finalStates
  end

  def run(string)
    state = @initialState
    string.each do |symbol|
      state = @stateTransitionFunction.transition(state, symbol)
      return false if not @states.include? state
    end
    @finalStates.include? state
  end
end
