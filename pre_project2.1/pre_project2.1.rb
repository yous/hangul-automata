require 'pre_project1.1/pre_project1.1'
require 'set'

class Set
  def to_s
    "{#{to_a.join(", ")}}"
  end
end

def epsilonClosure(stateTransitionFunction, states)
  savedStates = Set.new
  while savedStates != states
    (difference = states.difference savedStates).each do |state|
      nextState = stateTransitionFunction.transition(state, nil)
      if nextState.instance_of? Set
        states.merge nextState
      elsif not nextState.nil?
        states.add nextState
      end
    end
    savedStates.merge difference
  end
  states
end

def eNFA_to_mDFA(states, symbols, stateTransitionFunction, initialState, finalStates)
  mDFAtransition = Hash.new
  mDFAinitialState = epsilonClosure(stateTransitionFunction, Set.new([initialState]))
  mDFAstates = Set.new([mDFAinitialState])
  mDFAfinalStates = Set.new
  begin
    savedStates = mDFAstates.clone
    savedStates.each do |mDFAstate|
      mDFAtransition[mDFAstate] = Hash.new
      symbols.each do |symbol|
        nextStates = Set.new
        mDFAstate.each do |state|
          nextState = stateTransitionFunction.transition(state, symbol)
          if nextState.instance_of? Set
            nextStates.merge nextState
          elsif not nextState.nil?
            nextStates.add nextState
          end
        end
        mDFAtransition[mDFAstate][symbol] = epsilonClosure(stateTransitionFunction, nextStates)
        mDFAstates.add mDFAtransition[mDFAstate][symbol]
      end
    end
  end while savedStates != mDFAstates
  mDFAstates.each do |mDFAstate|
    mDFAstate.each do |state|
      if finalStates.include? state
        mDFAfinalStates.add mDFAstate
        break
      end
    end
  end

  inequivalenceTable = Set.new
  mDFAfinalStates.each do |mDFAfinalState|
    mDFAstates.entries.reject {|v| mDFAfinalStates.include? v}.each do |state|
      inequivalenceTable.add Set.new([state, mDFAfinalState])
    end
  end
  begin
    savedLength = inequivalenceTable.length
    mDFAstates.each_with_index do |stateA, idx|
      mDFAstates.entries[(idx + 1)..-1].each do |stateB|
        next if inequivalenceTable.include? Set.new([stateA, stateB])
        symbols.each do |symbol|
          if inequivalenceTable.include? Set.new([mDFAtransition[stateA][symbol], mDFAtransition[stateB][symbol]])
            inequivalenceTable.add Set.new([stateA, stateB])
            break
          end
        end
      end
    end
  end while savedLength != inequivalenceTable.length

  sameStates = []
  mDFAstates.each_with_index do |stateA, idx|
    mDFAstates.entries[(idx + 1)..-1].each do |stateB|
      if not inequivalenceTable.include? Set.new([stateA, stateB])
        sameStates.push [stateA.entries, stateB.entries]
      end
    end
  end
  sameStates.sort.each do |statePair|
    stateA = Set.new(statePair[0])
    stateB = Set.new(statePair[1])
    mDFAinitialState = stateA if mDFAinitialState == stateB
    mDFAstates.delete stateB
    mDFAfinalStates.delete stateB
    mDFAtransition.delete stateB
    mDFAtransition.keys.each do |state|
      if mDFAtransition[state]
        beforeStateSymbols = mDFAtransition[state].select do |symbol, nextState|
          nextState == stateB
        end.keys
        beforeStateSymbols.each do |symbol|
          mDFAtransition[state][symbol] = stateA
        end
      end
    end
  end

  return mDFAstates, symbols, StateTransitionFunction.new(mDFAtransition), mDFAinitialState, mDFAfinalStates
end
