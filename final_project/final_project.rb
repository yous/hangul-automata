# encoding: utf-8
require 'pre_project2.1/pre_project2.1'

def parseAST(ast, final_flag = false)
  if ast.nil? or not ast.instance_of? Hash
    $symbols.add ast if not ast.nil?
    $states.push "q#{$states.length}"
    $stateTransition[$states[-2]] ||= Hash.new
    $stateTransition[$states[-2]][ast] = $states[-1]
  elsif ast.instance_of? Hash
    case ast.keys[0]
    when "|"
      r_len = $states.length
      $states.push "q#{r_len}"
      $stateTransition[$states[-2]] ||= Hash.new
      $stateTransition[$states[-2]][nil] = Set.new([$states[-1]])
      parseAST(ast.values[0][0])

      s_len = $states.length
      $states.push "q#{s_len}"
      $stateTransition[$states[r_len - 1]][nil].add $states[-1]
      parseAST(ast.values[0][1])

      $states.push "q#{$states.length}"
      $stateTransition[$states[s_len - 1]] ||= Hash.new
      $stateTransition[$states[s_len - 1]][nil] = $states[-1]
      $stateTransition[$states[-2]] ||= Hash.new
      $stateTransition[$states[-2]][nil] = $states[-1]
    when "."
      parseAST(ast.values[0][0])
      $states.push "q#{$states.length}"
      $stateTransition[$states[-2]] ||= Hash.new
      $stateTransition[$states[-2]][nil] = $states[-1]

      parseAST(ast.values[0][1])
    when "*"
      r_len = $states.length
      $states.push "q#{r_len}"
      $stateTransition[$states[-2]] ||= Hash.new
      $stateTransition[$states[-2]][nil] = Set.new([$states[-1]])
      parseAST(ast.values[0])

      $states.push "q#{$states.length}"
      $stateTransition[$states[-2]] ||= Hash.new
      $stateTransition[$states[-2]][nil] = Set.new(["q#{r_len}", $states[-1]])
      $stateTransition[$states[r_len - 1]][nil].add $states[-1]
    end
  end
  $finalStates.push $states[-1] if final_flag
end

def simplifyState(states, symbols, stateTransitionFunction, initialState, finalStates)
  aliases = Hash.new
  states.each_with_index do |state, idx|
    aliases[state] = "q#{idx}"
  end
  stateTransition = Hash.new
  states.each do |state|
    stateTransition[aliases[state]] = Hash.new
    symbols.each do |symbol|
      stateTransition[aliases[state]][symbol] = aliases[stateTransitionFunction.transition(state, symbol)]
    end
  end
  states = states.map do |state|
    aliases[state]
  end
  initialState = aliases[initialState]
  finalStates = finalStates.map do |state|
    aliases[state]
  end
  return states, symbols, StateTransitionFunction.new(stateTransition), initialState, finalStates
end

def printDFA(states, symbols, stateTransitionFunction, initialState, finalStates)
  puts "states = [#{states.map(&:inspect).join(", ")}]"
  puts "symbols = [#{symbols.map(&:inspect).join(", ")}]"
  puts "stateTransition = {"
  puts states.map {|state|
"  #{state.inspect} => {
#{symbols.map do |symbol|
"    #{symbol.inspect} => #{stateTransitionFunction.transition(state, symbol).inspect}"
end.join(",\n")}
  }"
  }.join(",\n")
  puts "}"
  puts "initialState = #{initialState.inspect}"
  puts "finalStates = [#{finalStates.map(&:inspect).join(", ")}]"
end

def elementsToChar(buffer)
  cho = "ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ".chars.to_a
  jung = "ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ".chars.to_a
  jong = [nil] + "ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ".chars.to_a
  if buffer["first"].nil?
    ""
  elsif buffer["middle"].nil?
    buffer["first"]
  elsif buffer["middle"] == "·" or buffer["middle"] == "··"
    buffer["first"] + buffer["middle"]
  else
    [44032 + (cho.index(buffer["first"]) * jung.length + jung.index(buffer["middle"])) * jong.length + jong.index(buffer["last"])].pack("U*")
  end
end
