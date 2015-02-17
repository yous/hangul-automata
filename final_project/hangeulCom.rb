# encoding: utf-8
require 'pre_project2.1/pre_project2.1'
require 'project1/project1'
require 'final_project/final_project'
require 'final_project/comRegex.tab'

# ㄱㄴㄷㄹㅁㅂㅅㅇㅈㅊㅋㅌㅍㅎㄲㄸㅃㅆㅉ
cho = "rsefaqtdwczxvgREQTW".chars.to_a.join("|")
# ㅏ|ㅐ|ㅑ|ㅒ|ㅓ|ㅔ|ㅕ|ㅖ|ㅗ|ㅗㅏ|ㅗㅐ|ㅗㅣ|ㅛ|ㅜ|ㅜㅓ|ㅜㅔ|ㅜㅣ|ㅠ|ㅡ|ㅡㅣ|ㅣ
jung = ["k", "o", "i", "O", "j", "p", "u", "P", "h", "hk", "ho", "hl", "y", "n", "nj", "np", "nl", "b", "m", "ml", "l"].join("|")
# ㄱ|ㄱㅅ|ㄴ|ㄴㅈ|ㄴㅎ|ㄷ|ㄹ|ㄹㄱ|ㄹㅁ|ㄹㅂ|ㄹㅅ|ㄹㅌ|ㄹㅍ|ㄹㅎ|ㅁ|ㅂ|ㅂㅅ|ㅅ|ㅇ|ㅈ|ㅊ|ㅋ|ㅌ|ㅍ|ㅎ|ㄲ|ㅆ
jong = ["r", "rt", "s", "sw", "sg", "e", "f", "fr", "fa", "fq", "ft", "fx", "fv", "fg", "a", "q", "qt", "t", "d", "w", "c", "z", "x", "v", "g", "R", "T"].join("|")

regex = RegularExpression.new
hangeulRegex = "((#{cho})(#{jung})|(#{cho})(#{jung})(#{jong}))*"
ast = regex.scan_str(hangeulRegex)
$states = ["q0"]
$symbols = Set.new
$stateTransition = Hash.new
initialState = $states[0]
$finalStates = []
parseAST(ast, true)

mDFA = eNFA_to_mDFA($states, $symbols.entries, StateTransitionFunction.new($stateTransition), initialState, $finalStates)
states, symbols, stateTransitionFunction, initialState, finalStates = simplifyState(mDFA[0].entries, mDFA[1], mDFA[2], mDFA[3], mDFA[4].entries)
printDFA(states, symbols, stateTransitionFunction, initialState, finalStates)
