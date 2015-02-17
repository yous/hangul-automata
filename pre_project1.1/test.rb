# 다음은 사람(m)이 닭(c), 염소(g), 늑대(w)를 강 반대편으로 옮기는 문제를 DFA로 나타내고, 이를 입력받아 생성된 DFASimulator를 통해, 몇 가지 문자열이 언어인지 아닌지 확인하는 코드이다.
require "./pre_project1.1"

states = ["mCGW-0", "CW-mG", "mCW-G", "W-mCG", "C-mGW", "m-cgw", "mc-gw", "mw-cg", "mGW-C", "mCG-W", "0-mCGW", "mG-CW", "G-mCW"]
symbols = ["g", "m", "c", "w"]
transition = {
  "mCGW-0" => {"g" => "CW-mG", "m" => "m-cgw", "c" => "mc-gw", "w" => "mw-cg"},
  "CW-mG" => {"g" => "mCGW-0", "m" => "mCW-G", "c" => nil, "w" => nil},
  "mCW-G" => {"g" => nil, "m" => "CW-mG", "c" => "W-mCG", "w" => "C-mGW"},
  "W-mCG" => {"g" => "mGW-C", "m" => "mw-cg", "c" => "mCW-G", "w" => nil},
  "C-mGW" => {"g" => "mCG-W", "m" => "mc-gw", "c" => nil, "w" => "mCW-G"},
  "m-cgw" => {"g" => nil, "m" => nil, "c" => nil, "w" => nil},
  "mc-gw" => {"g" => nil, "m" => nil, "c" => nil, "w" => nil},
  "mw-cg" => {"g" => nil, "m" => nil, "c" => nil, "w" => nil},
  "mGW-C" => {"g" => "W-mCG", "m" => "mc-gw", "c" => nil, "w" => "G-mCW"},
  "mCG-W" => {"g" => "C-mGW", "m" => "mw-cg", "c" => "G-mCW", "w" => nil},
  "0-mCGW" => {"g" => "mG-CW", "m" => "m-cgw", "c" => "mc-gw", "w" => "mw-cg"},
  "mG-CW" => {"g" => "0-mCGW", "m" => "G-mCW", "c" => nil, "w" => nil},
  "G-mCW" => {"g" => nil, "m" => "mG-CW", "c" => "mCG-W", "w" => "mGW-C"}
}
initialState = "mCGW-0"
finalStates = ["0-mCGW"]
stf = StateTransitionFunction.new(transition)
dfaSimul = DFASimulator.new(
  states,
  symbols,
  stf,
  initialState,
  finalStates
)
puts dfaSimul.run("gmcgwmg".chars.to_a) # true
puts dfaSimul.run("gmwgcmg".chars.to_a) # true
puts dfaSimul.run("gmcmcwg".chars.to_a) # false
puts dfaSimul.run("gmwzcmg".chars.to_a) # false
puts dfaSimul.run("".chars.to_a) # false

=begin
코드를 실행한 결과는 다음과 같다.

true
true
false
false
false
=end
