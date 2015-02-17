# encoding: utf-8
require 'project1/project1'
require 'final_project/final_project'

states = ["q0", "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10"]
symbols = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ", "ㄲ", "ㄸ", "ㅃ", "ㅆ", "ㅉ", "ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅣ", "ㅛ", "ㅜ", "ㅠ", "ㅡ"]
stateTransition = {
  "q0" => {
    "ㄱ" => "q1",
    "ㄴ" => "q1",
    "ㄷ" => "q1",
    "ㄹ" => "q1",
    "ㅁ" => "q1",
    "ㅂ" => "q1",
    "ㅅ" => "q1",
    "ㅇ" => "q1",
    "ㅈ" => "q1",
    "ㅊ" => "q1",
    "ㅋ" => "q1",
    "ㅌ" => "q1",
    "ㅍ" => "q1",
    "ㅎ" => "q1",
    "ㄲ" => "q1",
    "ㄸ" => "q1",
    "ㅃ" => "q1",
    "ㅆ" => "q1",
    "ㅉ" => "q1",
    "ㅏ" => "q2",
    "ㅐ" => "q2",
    "ㅑ" => "q2",
    "ㅒ" => "q2",
    "ㅓ" => "q2",
    "ㅔ" => "q2",
    "ㅕ" => "q2",
    "ㅖ" => "q2",
    "ㅗ" => "q2",
    "ㅣ" => "q2",
    "ㅛ" => "q2",
    "ㅜ" => "q2",
    "ㅠ" => "q2",
    "ㅡ" => "q2"
  },
  "q1" => {
    "ㄱ" => "q2",
    "ㄴ" => "q2",
    "ㄷ" => "q2",
    "ㄹ" => "q2",
    "ㅁ" => "q2",
    "ㅂ" => "q2",
    "ㅅ" => "q2",
    "ㅇ" => "q2",
    "ㅈ" => "q2",
    "ㅊ" => "q2",
    "ㅋ" => "q2",
    "ㅌ" => "q2",
    "ㅍ" => "q2",
    "ㅎ" => "q2",
    "ㄲ" => "q2",
    "ㄸ" => "q2",
    "ㅃ" => "q2",
    "ㅆ" => "q2",
    "ㅉ" => "q2",
    "ㅏ" => "q3",
    "ㅐ" => "q3",
    "ㅑ" => "q3",
    "ㅒ" => "q3",
    "ㅓ" => "q3",
    "ㅔ" => "q3",
    "ㅕ" => "q3",
    "ㅖ" => "q3",
    "ㅗ" => "q4",
    "ㅣ" => "q3",
    "ㅛ" => "q3",
    "ㅜ" => "q5",
    "ㅠ" => "q3",
    "ㅡ" => "q6"
  },
  "q2" => {
    "ㄱ" => "q2",
    "ㄴ" => "q2",
    "ㄷ" => "q2",
    "ㄹ" => "q2",
    "ㅁ" => "q2",
    "ㅂ" => "q2",
    "ㅅ" => "q2",
    "ㅇ" => "q2",
    "ㅈ" => "q2",
    "ㅊ" => "q2",
    "ㅋ" => "q2",
    "ㅌ" => "q2",
    "ㅍ" => "q2",
    "ㅎ" => "q2",
    "ㄲ" => "q2",
    "ㄸ" => "q2",
    "ㅃ" => "q2",
    "ㅆ" => "q2",
    "ㅉ" => "q2",
    "ㅏ" => "q2",
    "ㅐ" => "q2",
    "ㅑ" => "q2",
    "ㅒ" => "q2",
    "ㅓ" => "q2",
    "ㅔ" => "q2",
    "ㅕ" => "q2",
    "ㅖ" => "q2",
    "ㅗ" => "q2",
    "ㅣ" => "q2",
    "ㅛ" => "q2",
    "ㅜ" => "q2",
    "ㅠ" => "q2",
    "ㅡ" => "q2"
  },
  "q3" => {
    "ㄱ" => "q7",
    "ㄴ" => "q8",
    "ㄷ" => "q9",
    "ㄹ" => "q10",
    "ㅁ" => "q9",
    "ㅂ" => "q7",
    "ㅅ" => "q9",
    "ㅇ" => "q9",
    "ㅈ" => "q9",
    "ㅊ" => "q9",
    "ㅋ" => "q9",
    "ㅌ" => "q9",
    "ㅍ" => "q9",
    "ㅎ" => "q9",
    "ㄲ" => "q9",
    "ㄸ" => "q1",
    "ㅃ" => "q1",
    "ㅆ" => "q9",
    "ㅉ" => "q1",
    "ㅏ" => "q2",
    "ㅐ" => "q2",
    "ㅑ" => "q2",
    "ㅒ" => "q2",
    "ㅓ" => "q2",
    "ㅔ" => "q2",
    "ㅕ" => "q2",
    "ㅖ" => "q2",
    "ㅗ" => "q2",
    "ㅣ" => "q2",
    "ㅛ" => "q2",
    "ㅜ" => "q2",
    "ㅠ" => "q2",
    "ㅡ" => "q2"
  },
  "q4" => {
    "ㄱ" => "q7",
    "ㄴ" => "q8",
    "ㄷ" => "q9",
    "ㄹ" => "q10",
    "ㅁ" => "q9",
    "ㅂ" => "q7",
    "ㅅ" => "q9",
    "ㅇ" => "q9",
    "ㅈ" => "q9",
    "ㅊ" => "q9",
    "ㅋ" => "q9",
    "ㅌ" => "q9",
    "ㅍ" => "q9",
    "ㅎ" => "q9",
    "ㄲ" => "q9",
    "ㄸ" => "q1",
    "ㅃ" => "q1",
    "ㅆ" => "q9",
    "ㅉ" => "q1",
    "ㅏ" => "q3",
    "ㅐ" => "q3",
    "ㅑ" => "q2",
    "ㅒ" => "q2",
    "ㅓ" => "q2",
    "ㅔ" => "q2",
    "ㅕ" => "q2",
    "ㅖ" => "q2",
    "ㅗ" => "q2",
    "ㅣ" => "q3",
    "ㅛ" => "q2",
    "ㅜ" => "q2",
    "ㅠ" => "q2",
    "ㅡ" => "q2"
  },
  "q5" => {
    "ㄱ" => "q7",
    "ㄴ" => "q8",
    "ㄷ" => "q9",
    "ㄹ" => "q10",
    "ㅁ" => "q9",
    "ㅂ" => "q7",
    "ㅅ" => "q9",
    "ㅇ" => "q9",
    "ㅈ" => "q9",
    "ㅊ" => "q9",
    "ㅋ" => "q9",
    "ㅌ" => "q9",
    "ㅍ" => "q9",
    "ㅎ" => "q9",
    "ㄲ" => "q9",
    "ㄸ" => "q1",
    "ㅃ" => "q1",
    "ㅆ" => "q9",
    "ㅉ" => "q1",
    "ㅏ" => "q2",
    "ㅐ" => "q2",
    "ㅑ" => "q2",
    "ㅒ" => "q2",
    "ㅓ" => "q3",
    "ㅔ" => "q3",
    "ㅕ" => "q2",
    "ㅖ" => "q2",
    "ㅗ" => "q2",
    "ㅣ" => "q3",
    "ㅛ" => "q2",
    "ㅜ" => "q2",
    "ㅠ" => "q2",
    "ㅡ" => "q2"
  },
  "q6" => {
    "ㄱ" => "q7",
    "ㄴ" => "q8",
    "ㄷ" => "q9",
    "ㄹ" => "q10",
    "ㅁ" => "q9",
    "ㅂ" => "q7",
    "ㅅ" => "q9",
    "ㅇ" => "q9",
    "ㅈ" => "q9",
    "ㅊ" => "q9",
    "ㅋ" => "q9",
    "ㅌ" => "q9",
    "ㅍ" => "q9",
    "ㅎ" => "q9",
    "ㄲ" => "q9",
    "ㄸ" => "q1",
    "ㅃ" => "q1",
    "ㅆ" => "q9",
    "ㅉ" => "q1",
    "ㅏ" => "q2",
    "ㅐ" => "q2",
    "ㅑ" => "q2",
    "ㅒ" => "q2",
    "ㅓ" => "q2",
    "ㅔ" => "q2",
    "ㅕ" => "q2",
    "ㅖ" => "q2",
    "ㅗ" => "q2",
    "ㅣ" => "q3",
    "ㅛ" => "q2",
    "ㅜ" => "q2",
    "ㅠ" => "q2",
    "ㅡ" => "q2"
  },
  "q7" => {
    "ㄱ" => "q1",
    "ㄴ" => "q1",
    "ㄷ" => "q1",
    "ㄹ" => "q1",
    "ㅁ" => "q1",
    "ㅂ" => "q1",
    "ㅅ" => "q9",
    "ㅇ" => "q1",
    "ㅈ" => "q1",
    "ㅊ" => "q1",
    "ㅋ" => "q1",
    "ㅌ" => "q1",
    "ㅍ" => "q1",
    "ㅎ" => "q1",
    "ㄲ" => "q1",
    "ㄸ" => "q1",
    "ㅃ" => "q1",
    "ㅆ" => "q1",
    "ㅉ" => "q1",
    "ㅏ" => "q3",
    "ㅐ" => "q3",
    "ㅑ" => "q3",
    "ㅒ" => "q3",
    "ㅓ" => "q3",
    "ㅔ" => "q3",
    "ㅕ" => "q3",
    "ㅖ" => "q3",
    "ㅗ" => "q4",
    "ㅣ" => "q3",
    "ㅛ" => "q3",
    "ㅜ" => "q5",
    "ㅠ" => "q3",
    "ㅡ" => "q6"
  },
  "q8" => {
    "ㄱ" => "q1",
    "ㄴ" => "q1",
    "ㄷ" => "q1",
    "ㄹ" => "q1",
    "ㅁ" => "q1",
    "ㅂ" => "q1",
    "ㅅ" => "q1",
    "ㅇ" => "q1",
    "ㅈ" => "q9",
    "ㅊ" => "q1",
    "ㅋ" => "q1",
    "ㅌ" => "q1",
    "ㅍ" => "q1",
    "ㅎ" => "q9",
    "ㄲ" => "q1",
    "ㄸ" => "q1",
    "ㅃ" => "q1",
    "ㅆ" => "q1",
    "ㅉ" => "q1",
    "ㅏ" => "q3",
    "ㅐ" => "q3",
    "ㅑ" => "q3",
    "ㅒ" => "q3",
    "ㅓ" => "q3",
    "ㅔ" => "q3",
    "ㅕ" => "q3",
    "ㅖ" => "q3",
    "ㅗ" => "q4",
    "ㅣ" => "q3",
    "ㅛ" => "q3",
    "ㅜ" => "q5",
    "ㅠ" => "q3",
    "ㅡ" => "q6"
  },
  "q9" => {
    "ㄱ" => "q1",
    "ㄴ" => "q1",
    "ㄷ" => "q1",
    "ㄹ" => "q1",
    "ㅁ" => "q1",
    "ㅂ" => "q1",
    "ㅅ" => "q1",
    "ㅇ" => "q1",
    "ㅈ" => "q1",
    "ㅊ" => "q1",
    "ㅋ" => "q1",
    "ㅌ" => "q1",
    "ㅍ" => "q1",
    "ㅎ" => "q1",
    "ㄲ" => "q1",
    "ㄸ" => "q1",
    "ㅃ" => "q1",
    "ㅆ" => "q1",
    "ㅉ" => "q1",
    "ㅏ" => "q3",
    "ㅐ" => "q3",
    "ㅑ" => "q3",
    "ㅒ" => "q3",
    "ㅓ" => "q3",
    "ㅔ" => "q3",
    "ㅕ" => "q3",
    "ㅖ" => "q3",
    "ㅗ" => "q4",
    "ㅣ" => "q3",
    "ㅛ" => "q3",
    "ㅜ" => "q5",
    "ㅠ" => "q3",
    "ㅡ" => "q6"
  },
  "q10" => {
    "ㄱ" => "q9",
    "ㄴ" => "q1",
    "ㄷ" => "q1",
    "ㄹ" => "q1",
    "ㅁ" => "q9",
    "ㅂ" => "q9",
    "ㅅ" => "q9",
    "ㅇ" => "q1",
    "ㅈ" => "q1",
    "ㅊ" => "q1",
    "ㅋ" => "q1",
    "ㅌ" => "q9",
    "ㅍ" => "q9",
    "ㅎ" => "q9",
    "ㄲ" => "q1",
    "ㄸ" => "q1",
    "ㅃ" => "q1",
    "ㅆ" => "q1",
    "ㅉ" => "q1",
    "ㅏ" => "q3",
    "ㅐ" => "q3",
    "ㅑ" => "q3",
    "ㅒ" => "q3",
    "ㅓ" => "q3",
    "ㅔ" => "q3",
    "ㅕ" => "q3",
    "ㅖ" => "q3",
    "ㅗ" => "q4",
    "ㅣ" => "q3",
    "ㅛ" => "q3",
    "ㅜ" => "q5",
    "ㅠ" => "q3",
    "ㅡ" => "q6"
  }
}
initialState = "q0"
finalStates = ["q0", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10"]

=begin
q0: Initial state
q1: 초성
q2: Dead state
q3: 초성 + 중성
q4: 초성 + ㅗ
q5: 초성 + ㅜ
q6: 초성 + ㅡ
q7: 초성 + 중성 + ㄱ, ㅂ
q8: 초성 + 중성 + ㄴ
q9: 초성 + 중성 + 종성
q10: 초성 + 중성 + ㄹ
=end

outputTransition = Hash.new
states.each do |state|
  outputTransition[state] = Hash.new
end
# 초성 (q0 => q1)
stateTransition["q0"].select {|key, val| val == "q1"}.keys.each do |symbol|
  outputTransition["q0"][symbol] = lambda {|state, symbol|
    $buffer["first"] = symbol
  }
end
# 초성 + 중성 (q1 => q3)
stateTransition["q1"].select {|key, val| val == "q3"}.keys.each do |symbol|
  outputTransition["q1"][symbol] = lambda {|state, symbol|
    $buffer["middle"] = symbol
  }
end
# 초성 + 중성 + 초성 (q3, q4, q5, q6 => q1)
["q3", "q4", "q5", "q6"].each do |state|
  stateTransition[state].select {|key, val| val == "q1"}.keys.each do |symbol|
    outputTransition[state][symbol] = lambda {|state, symbol|
      $result += elementsToChar($buffer)
      $buffer.clear
      $buffer["first"] = symbol
    }
  end
end
# 초성 + 중성 + 종성 (q3, q4, q5, q6 => q7, q8, q9, q10)
["q3", "q4", "q5", "q6"].each do |state|
  stateTransition[state].select {|key, val| ["q7", "q8", "q9", "q10"].include? val}.keys.each do |symbol|
    outputTransition[state][symbol] = lambda {|state, symbol|
      $buffer["last"] = symbol
    }
  end
end
# 초성 + ㅗ + 모음 (q4 => q3)
stateTransition["q4"].select {|key, val| val == "q3"}.keys.each do |symbol|
  outputTransition["q4"][symbol] = lambda {|state, symbol|
    $buffer["middle"] = case symbol
                        when "ㅏ" then "ㅘ"
                        when "ㅐ" then "ㅙ"
                        when "ㅣ" then "ㅚ"
                        end
  }
end
# 초성 + ㅜ + 모음 (q5 => q3)
stateTransition["q5"].select {|key, val| val == "q3"}.keys.each do |symbol|
  outputTransition["q5"][symbol] = lambda {|state, symbol|
    $buffer["middle"] = case symbol
                        when "ㅓ" then "ㅝ"
                        when "ㅔ" then "ㅞ"
                        when "ㅣ" then "ㅟ"
                        end
  }
end
# 초성 + ㅡ + 모음 (q6 => q3)
outputTransition["q6"]["ㅣ"] = lambda {|state, symbol|
  $buffer["middle"] = "ㅢ"
}
# 초성 + 중성 + 종성 + 초성 (q7, q8, q9, q10 => q1)
["q7", "q8", "q9", "q10"].each do |state|
  stateTransition[state].select {|key, val| val == "q1"}.keys.each do |symbol|
    outputTransition[state][symbol] = lambda {|state, symbol|
      $result += elementsToChar($buffer)
      $buffer.clear
      $buffer["first"] = symbol
    }
  end
end
# 초성 + 중성 + 종성 + 중성 (q7, q8, q9, q10 => q3, q4, q5, q6)
["q7", "q8", "q9", "q10"].each do |state|
  stateTransition[state].select {|key, val| ["q3", "q4", "q5", "q6"].include? val}.keys.each do |symbol|
    outputTransition[state][symbol] = lambda {|state, symbol|
      $buffer["last"], tmp = case $buffer["last"]
                             when "ㄳ" then ["ㄱ", "ㅅ"]
                             when "ㄵ" then ["ㄴ", "ㅈ"]
                             when "ㄶ" then ["ㄴ", "ㅎ"]
                             when "ㄺ" then ["ㄹ", "ㄱ"]
                             when "ㄻ" then ["ㄹ", "ㅁ"]
                             when "ㄼ" then ["ㄹ", "ㅂ"]
                             when "ㄽ" then ["ㄹ", "ㅅ"]
                             when "ㄾ" then ["ㄹ", "ㅌ"]
                             when "ㄿ" then ["ㄹ", "ㅍ"]
                             when "ㅀ" then ["ㄹ", "ㅎ"]
                             when "ㅄ" then ["ㅂ", "ㅅ"]
                             else [nil, $buffer["last"]]
                             end
      $result += elementsToChar($buffer)
      $buffer.clear
      $buffer["first"] = tmp
      $buffer["middle"] = symbol
    }
  end
end
# 초성 + 중성 + ㄱ, ㅂ + 종성 (q7 => q9)
outputTransition["q7"]["ㅅ"] = lambda {|state, symbol|
  $buffer["last"] = case $buffer["last"]
                    when "ㄱ" then "ㄳ"
                    when "ㅂ" then "ㅄ"
                    end
}
# 초성 + 중성 + ㄴ + 종성 (q8 => q9)
stateTransition["q8"].select {|key, val| val == "q9"}.keys.each do |symbol|
  outputTransition["q8"][symbol] = lambda {|state, symbol|
    $buffer["last"] = case symbol
                      when "ㅈ" then "ㄵ"
                      when "ㅎ" then "ㄶ"
                      end
  }
end
# 초성 + 중성 + ㄹ + 종성 (q10 => q9)
stateTransition["q10"].select {|key, val| val == "q9"}.keys.each do |symbol|
  outputTransition["q10"][symbol] = lambda {|state, symbol|
    $buffer["last"] = case symbol
                      when "ㄱ" then "ㄺ"
                      when "ㅁ" then "ㄻ"
                      when "ㅂ" then "ㄼ"
                      when "ㅅ" then "ㄽ"
                      when "ㅌ" then "ㄾ"
                      when "ㅍ" then "ㄿ"
                      when "ㅎ" then "ㅀ"
                      end
  }
end
outputs = outputTransition.values.map(&:values).reduce(:+)
stateTransitionFunction = StateTransitionFunction.new(stateTransition)
outputFunction = OutputFunction.new(outputTransition)

def delTransitionFunction
  if $buffer["first"].nil?
    $result = $result[0...-1]
    "q0"
  elsif $buffer["middle"].nil?
    $buffer["first"] = nil
    "q0"
  elsif $buffer["last"].nil?
    case $buffer["middle"]
    when "ㅘ", "ㅙ", "ㅚ"
      $buffer["middle"] = "ㅗ"
      "q4"
    when "ㅝ", "ㅞ", "ㅟ"
      $buffer["middle"] = "ㅜ"
      "q5"
    when "ㅢ"
      $buffer["middle"] = "ㅡ"
      "q6"
    else
      $buffer["middle"] = nil
      "q1"
    end
  else
    case $buffer["last"]
    when "ㄳ"
      $buffer["last"] = "ㄱ"
      "q7"
    when "ㄵ", "ㄶ"
      $buffer["last"] = "ㄴ"
      "q8"
    when "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ", "ㅀ"
      $buffer["last"] = "ㄹ"
      "q10"
    when "ㅄ"
      $buffer["last"] = "ㅂ"
      "q7"
    else
      $buffer["last"] = nil
      case $buffer["middle"]
      when "ㅗ" then "q4"
      when "ㅜ" then "q5"
      when "ㅡ" then "q6"
      else "q3"
      end
    end
  end
end

hangeulComJong = HangeulAutomata.new(states, symbols, outputs, stateTransitionFunction, outputFunction, initialState, method(:delTransitionFunction))
hangeulComJong.run
