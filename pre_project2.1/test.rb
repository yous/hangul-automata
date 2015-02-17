require 'pre_project2.1/pre_project2.1'

def mDFAoutput(states, symbols, stateTransitionFunction, initialState, finalStates)
  puts "state = #{states}"
  puts "final_state = #{finalStates}"
  states.each do |state|
    symbols.each do |symbol|
      puts "(#{state}, #{stateTransitionFunction.transition(state, symbol)}, #{symbol})"
    end
  end
end

# DFA
puts "TEST #1 START"
states = ["A", "B", "C", "D", "E", "F"]
symbols = ["0", "1"]
stateTransition = {
  "A" => {"0" => "B", "1" => "A"},
  "B" => {"0" => "B", "1" => "C"},
  "C" => {"0" => "B", "1" => "D"},
  "D" => {"0" => "E", "1" => "A"},
  "E" => {"0" => "B", "1" => "F"},
  "F" => {"0" => "B", "1" => "D"}
}
initialState = "A"
finalStates = ["F"]
mDFA = eNFA_to_mDFA(states, symbols, StateTransitionFunction.new(stateTransition), initialState, finalStates)
mDFAoutput(mDFA[0], mDFA[1], mDFA[2], mDFA[3], mDFA[4])
_DFAsimul = DFASimulator.new(mDFA[0].entries, mDFA[1], mDFA[2], mDFA[3], mDFA[4].entries)
puts _DFAsimul.run("01101".chars.to_a) # true
puts _DFAsimul.run("0010011".chars.to_a) # false
puts "TEST #1 END\n"

# DFA
puts "TEST #2 START"
states = [1, 2, 3, 4]
symbols = ["a", "b"]
stateTransition = {
  1 => {"a" => 3, "b" => 1},
  2 => {"a" => 1, "b" => 3},
  3 => {"a" => 2, "b" => 4},
  4 => {"a" => 4, "b" => 2}
}
initialState = 1
finalStates = [1]
mDFA = eNFA_to_mDFA(states, symbols, StateTransitionFunction.new(stateTransition), initialState, finalStates)
mDFAoutput(mDFA[0], mDFA[1], mDFA[2], mDFA[3], mDFA[4])
_DFAsimul = DFASimulator.new(mDFA[0].entries, mDFA[1], mDFA[2], mDFA[3], mDFA[4].entries)
puts _DFAsimul.run("ab".chars.to_a) # false
puts _DFAsimul.run("bbbb".chars.to_a) # true
puts "TEST #2 END\n"

# DFA with partial function
puts "TEST #3 START"
states = [1, 2, 3, 4]
symbols = [0, 1]
stateTransition = {
  1 => {0 => 2, 1 => 3},
  2 => {1 => 4},
  3 => {0 => 4},
  4 => {0 => 1}
}
initialState = 1
finalStates = [1]
mDFA = eNFA_to_mDFA(states, symbols, StateTransitionFunction.new(stateTransition), initialState, finalStates)
mDFAoutput(mDFA[0], mDFA[1], mDFA[2], mDFA[3], mDFA[4])
_DFAsimul = DFASimulator.new(mDFA[0].entries, mDFA[1], mDFA[2], mDFA[3], mDFA[4].entries)
puts _DFAsimul.run([1, 1, 0]) # false
puts _DFAsimul.run([0, 1, 0]) # true
puts "TEST #3 END\n"

# NFA
puts "TEST #4 START"
states = ["A", "B", "C", "D", "F", "G"]
symbols = [0, 1]
stateTransition = {
  "A" => {0 => Set.new(["A", "B"]), 1 => "A"},
  "B" => {1 => "C"},
  "C" => {1 => "D"},
  "D" => {0 => "F"},
  "F" => {1 => "G"}
}
initialState = "A"
finalStates = ["G"]
mDFA = eNFA_to_mDFA(states, symbols, StateTransitionFunction.new(stateTransition), initialState, finalStates)
mDFAoutput(mDFA[0], mDFA[1], mDFA[2], mDFA[3], mDFA[4])
_DFAsimul = DFASimulator.new(mDFA[0].entries, mDFA[1], mDFA[2], mDFA[3], mDFA[4].entries)
puts _DFAsimul.run([1, 1, 0]) # false
puts _DFAsimul.run([1, 0, 1, 1, 0, 1]) # true
puts _DFAsimul.run([0, 0, 0, 1, 1, 0, 1]) # true
puts "TEST #4 END\n"

# NFA
puts "TEST #5 START"
states = [1, 2, 3, 4, 5]
symbols = [0, 1]
stateTransition = {
  1 => {0 => Set.new([2, 3])},
  2 => {0 => 4, 1 => 3},
  3 => {0 => 4, 1 => 3},
  4 => {0 => 5, 1 => 1},
  5 => {0 => 1}
}
initialState = 1
finalStates = [5]
mDFA = eNFA_to_mDFA(states, symbols, StateTransitionFunction.new(stateTransition), initialState, finalStates)
mDFAoutput(mDFA[0], mDFA[1], mDFA[2], mDFA[3], mDFA[4])
_DFAsimul = DFASimulator.new(mDFA[0].entries, mDFA[1], mDFA[2], mDFA[3], mDFA[4].entries)
puts _DFAsimul.run([1, 1, 1]) # false
puts _DFAsimul.run([1, 0, 0, 0]) # false
puts _DFAsimul.run([0, 0, 0]) # true
puts "TEST #5 END\n"

# DFA which of states can be minimized
puts "TEST #6 START"
states = ["A", "B", "C", "D", "E", "F", "G", "H"]
symbols = [0, 1]
stateTransition = {
  "A" => {0 => "B", 1 => "F"},
  "B" => {0 => "G", 1 => "C"},
  "C" => {0 => "A", 1 => "C"},
  "D" => {0 => "C", 1 => "G"},
  "E" => {0 => "H", 1 => "F"},
  "F" => {0 => "C", 1 => "G"},
  "G" => {0 => "G", 1 => "E"},
  "H" => {0 => "G", 1 => "C"}
}
initialState = "A"
finalStates = ["C"]
mDFA = eNFA_to_mDFA(states, symbols, StateTransitionFunction.new(stateTransition), initialState, finalStates)
mDFAoutput(mDFA[0], mDFA[1], mDFA[2], mDFA[3], mDFA[4])
_DFAsimul = DFASimulator.new(mDFA[0].entries, mDFA[1], mDFA[2], mDFA[3], mDFA[4].entries)
puts _DFAsimul.run([1, 0]) # true
puts _DFAsimul.run([0, 1]) # true
puts _DFAsimul.run([1, 1, 1, 1, 0]) # true
puts "TEST #6 END\n"

# epsilon-NFA
puts "TEST #7 START"
states = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
symbols = [0, 1]
stateTransition = {
  1 => {nil => Set.new([2, 8])},
  2 => {nil => Set.new([3, 4])},
  3 => {0 => 5},
  4 => {1 => 6},
  5 => {nil => 7},
  6 => {nil => 7},
  7 => {nil => Set.new([2, 8])},
  8 => {0 => 9},
  9 => {1 => 10},
  10 => {1 => 11},
  11 => {0 => 12},
  12 => {1 => 13}
}
initialState = 1
finalStates = [13]
mDFA = eNFA_to_mDFA(states, symbols, StateTransitionFunction.new(stateTransition), initialState, finalStates)
mDFAoutput(mDFA[0], mDFA[1], mDFA[2], mDFA[3], mDFA[4])
_DFAsimul = DFASimulator.new(mDFA[0].entries, mDFA[1], mDFA[2], mDFA[3], mDFA[4].entries)
puts _DFAsimul.run([1, 0, 1, 1, 0, 1]) # true
puts _DFAsimul.run([0, 1, 1, 0, 1]) # true
puts "TEST #7 END\n"
