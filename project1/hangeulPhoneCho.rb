# encoding: utf-8
require 'project1/project1'
require 'set'

# ㅣ   ·    ㅡ
# ㄱㅋ ㄴㄹ ㄷㅌ
# ㅂㅍ ㅅㅎ ㅈㅊ
# .,?! ㅇㅁ Space

states = [
  "S", "F4", "F5", "F6", "F7", "F8", "F9", "F0", "F*",
  "M.", "M..", "MA", "MEO", "MO", "MOI", "MU", "MYU", "MEU", "MI", "ML",
  "L41", "L42", "L43", "L51", "L52", "L61", "L62", "L63", "L71", "L72", "L73", "L81", "L82", "L83", "L91", "L92", "L93", "L01", "L02",
  "L4181", "L4182", "L4183", # ㄱ
  "L5181", "L5182", "L5183", "L5191", "L5192", "L5193", # ㄴ
  "L5241", "L5242", "L5243", "L5261", "L5262", "L5263", "L5271", "L5272", "L5273", "L5281", "L5282", "L5283", "L5201", "L5202", # ㄹ
  "L7181", "L7182", "L7183" # ㅂ
]
lStates = [
  "L41", "L42", "L43", "L51", "L52", "L61", "L62", "L63", "L71", "L72", "L73", "L81", "L82", "L83", "L91", "L92", "L93", "L01", "L02"
]
l2States = [
  "L4181", "L4182", "L4183",
  "L5181", "L5182", "L5183", "L5191", "L5192", "L5193",
  "L5241", "L5242", "L5243", "L5261", "L5262", "L5263", "L5271", "L5272", "L5273", "L5281", "L5282", "L5283", "L5201", "L5202",
  "L7181", "L7182", "L7183"
]
symbols = "0123456789*#".chars.to_a
transition = Hash.new
outputTransition = Hash.new
states.each do |state|
  transition[state] = Hash.new
  outputTransition[state] = Hash.new
end
"4567890*".chars.each do |symbol|
  transition["S"][symbol] = "F#{symbol}"
  outputTransition["S"][symbol] = lambda {|state, symbol|
    $buffer["first"] = case symbol
                       when "4" then "ㄱ"
                       when "5" then "ㄴ"
                       when "6" then "ㄷ"
                       when "7" then "ㅂ"
                       when "8" then "ㅅ"
                       when "9" then "ㅈ"
                       when "0" then "ㅇ"
                       when "*" then "."
                       end
  }
  transition["F#{symbol}"][symbol] = "F#{symbol}"
  outputTransition["F#{symbol}"][symbol] = lambda {|state, symbol|
    $buffer["first"] = case $buffer["first"]
                       when "ㄱ" then "ㅋ"
                       when "ㅋ" then "ㄲ"
                       when "ㄲ" then "ㄱ"
                       when "ㄴ" then "ㄹ"
                       when "ㄹ" then "ㄴ"
                       when "ㄷ" then "ㅌ"
                       when "ㅌ" then "ㄸ"
                       when "ㄸ" then "ㄷ"
                       when "ㅂ" then "ㅍ"
                       when "ㅍ" then "ㅃ"
                       when "ㅃ" then "ㅂ"
                       when "ㅅ" then "ㅎ"
                       when "ㅎ" then "ㅆ"
                       when "ㅆ" then "ㅅ"
                       when "ㅈ" then "ㅊ"
                       when "ㅊ" then "ㅉ"
                       when "ㅉ" then "ㅈ"
                       when "ㅇ" then "ㅁ"
                       when "ㅁ" then "ㅇ"
                       when "." then ","
                       when "," then "?"
                       when "?" then "!"
                       when "!" then "."
                       end
  }
  "4567890*".chars.to_a.reject {|v| v == symbol}.each do |state|
    transition["F#{state}"][symbol] = "F#{symbol}"
    outputTransition["F#{state}"][symbol] = lambda {|state, symbol|
      $result += elementsToChar($buffer)
      $buffer.clear
      $buffer["first"] = case symbol
                         when "4" then "ㄱ"
                         when "5" then "ㄴ"
                         when "6" then "ㄷ"
                         when "7" then "ㅂ"
                         when "8" then "ㅅ"
                         when "9" then "ㅈ"
                         when "0" then "ㅇ"
                         when "*" then "."
                         end
    }
  end
end
transition["S"]["#"] = "S"
outputTransition["S"]["#"] = lambda {|state, symbol|
  $result += " "
  $buffer.clear
}
states.reject {|v| v == "S"}.each do |state|
  transition[state]["#"] = "S"
  outputTransition[state]["#"] = lambda {|state, symbol|
    case $buffer["next"]
    when "ㄸ", "ㅃ", "ㅉ"
      $result += elementsToChar($buffer)
      tmp = $buffer["next"]
      $buffer.clear
      $buffer["first"] = tmp
    else
      if $buffer["last"].nil?
        $buffer["last"] = $buffer["next"]
      else
        case state
        when "L4181"
          $buffer["last"] = "ㄳ"
        when "L5182"
          $buffer["last"] = "ㄶ"
        when "L5191"
          $buffer["last"] = "ㄵ"
        when "L5241"
          $buffer["last"] = "ㄺ"
        when "L5262"
          $buffer["last"] = "ㄾ"
        when "L5271"
          $buffer["last"] = "ㄼ"
        when "L5272"
          $buffer["last"] = "ㄿ"
        when "L5281"
          $buffer["last"] = "ㄽ"
        when "L5282"
          $buffer["last"] = "ㅀ"
        when "L5202"
          $buffer["last"] = "ㄻ"
        else
          $result += elementsToChar($buffer)
          tmp = $buffer["next"]
          $buffer.clear
          $buffer["first"] = tmp
        end
      end
    end
    $result += elementsToChar($buffer)
    $buffer.clear
  }
end
states.reject {|v| v == "F*"}.each do |state|
  transition[state]["*"] = "F*"
  outputTransition[state]["*"] = lambda {|state, symbol|
    case $buffer["next"]
    when "ㄸ", "ㅃ", "ㅉ"
      $result += elementsToChar($buffer)
      tmp = $buffer["next"]
      $buffer.clear
      $buffer["first"] = tmp
    else
      if $buffer["last"].nil?
        $buffer["last"] = $buffer["next"]
      else
        case state
        when "L4181"
          $buffer["last"] = "ㄳ"
        when "L5182"
          $buffer["last"] = "ㄶ"
        when "L5191"
          $buffer["last"] = "ㄵ"
        when "L5241"
          $buffer["last"] = "ㄺ"
        when "L5262"
          $buffer["last"] = "ㄾ"
        when "L5271"
          $buffer["last"] = "ㄼ"
        when "L5272"
          $buffer["last"] = "ㄿ"
        when "L5281"
          $buffer["last"] = "ㄽ"
        when "L5282"
          $buffer["last"] = "ㅀ"
        when "L5202"
          $buffer["last"] = "ㄻ"
        else
          $result += elementsToChar($buffer)
          tmp = $buffer["next"]
          $buffer.clear
          $buffer["first"] = tmp
        end
      end
    end
    $result += elementsToChar($buffer)
    $buffer.clear
  }
end

#     1  2  3
# M.  EO .. O  : ·
# M.. EO .  L  : ··
# MA  L  A  X  : ㅏ ㅑ
# MEO L  X  X  : ㅓ ㅕ ㅘ ㅝ
# MO  OI X  X  : ㅗ
# MOI X  EO X  : ㅚ
# MU  L  YU X  : ㅜ
# MYU EO U  X  : ㅠ
# MEU L  U  X  : ㅡ
# MI  X  A  X  : ㅣ
# ML  X  X  X  : ㅐ ㅒ ㅔ ㅖ ㅙ ㅛ ㅞ ㅟ ㅢ

"4567890".chars.each do |state|
  transition["F#{state}"]["1"] = "MI" # ㅣ
  outputTransition["F#{state}"]["1"] = lambda {|state, symbol|
    $buffer["middle"] = "ㅣ"
  }
  transition["F#{state}"]["2"] = "M." # ·
  outputTransition["F#{state}"]["2"] = lambda {|state, symbol|
    $buffer["middle"] = "·"
  }
  transition["F#{state}"]["3"] = "MEU" # ㅡ
  outputTransition["F#{state}"]["3"] = lambda {|state, symbol|
    $buffer["middle"] = "ㅡ"
  }
end
"123".chars.each do |symbol|
  transition["M."][symbol] = case symbol
                             when "1" then "MEO"
                             when "2" then "M.."
                             when "3" then "MO"
                             end
  outputTransition["M."][symbol] = lambda {|state, symbol|
    $buffer["middle"] = case symbol
                        when "1" then "ㅓ"
                        when "2" then "··"
                        when "3" then "ㅗ"
                        end
  }
  transition["M.."][symbol] = case symbol
                              when "1" then "MEO"
                              when "2" then "M."
                              when "3" then "ML"
                              end
  outputTransition["M.."][symbol] = lambda {|state, symbol|
    $buffer["middle"] = case symbol
                        when "1" then "ㅕ"
                        when "2" then "·"
                        when "3" then "ㅛ"
                        end
  }
end
transition["MA"]["1"] = "ML"
outputTransition["MA"]["1"] = lambda {|state, symbol|
  $buffer["middle"] = case $buffer["middle"]
                      when "ㅏ" then "ㅐ"
                      when "ㅑ" then "ㅒ"
                      end
}
transition["MA"]["2"] = "MA"
outputTransition["MA"]["2"] = lambda {|state, symbol|
  $buffer["middle"] = case $buffer["middle"]
                      when "ㅏ" then "ㅑ"
                      when "ㅑ" then "ㅏ"
                      end
}
transition["MEO"]["1"] = "ML"
outputTransition["MEO"]["1"] = lambda {|state, symbol|
  $buffer["middle"] = case $buffer["middle"]
                      when "ㅓ" then "ㅔ"
                      when "ㅕ" then "ㅖ"
                      when "ㅘ" then "ㅙ"
                      when "ㅝ" then "ㅞ"
                      end
}
transition["MO"]["1"] = "MOI"
outputTransition["MO"]["1"] = lambda {|state, symbol|
  $buffer["middle"] = "ㅚ"
}
transition["MOI"]["2"] = "MEO"
outputTransition["MOI"]["2"] = lambda {|state, symbol|
  $buffer["middle"] = "ㅘ"
}
"12".chars.each do |symbol|
  transition["MU"][symbol] = case symbol
                             when "1" then "ML"
                             when "2" then "MYU"
                             end
  outputTransition["MU"][symbol] = lambda {|state, symbol|
    $buffer["middle"] = case symbol
                        when "1" then "ㅟ"
                        when "2" then "ㅠ"
                        end
  }
  transition["MYU"][symbol] = case symbol
                              when "1" then "MEO"
                              when "2" then "MU"
                              end
  outputTransition["MYU"][symbol] = lambda {|state, symbol|
    $buffer["middle"] = case symbol
                        when "1" then "ㅝ"
                        when "2" then "ㅜ"
                        end
  }
  transition["MEU"][symbol] = case symbol
                              when "1" then "ML"
                              when "2" then "MU"
                              end
  outputTransition["MEU"][symbol] = lambda {|state, symbol|
    $buffer["middle"] = case symbol
                        when "1" then "ㅢ"
                        when "2" then "ㅜ"
                        end
  }
end
transition["MI"]["2"] = "MA"
outputTransition["MI"]["2"] = lambda {|state, symbol|
  $buffer["middle"] = "ㅏ"
}

"4567890".chars.each do |symbol|
  ["MA", "MEO", "MO", "MOI", "MU", "MYU", "MEU", "MI", "ML"].each do |state|
    transition[state][symbol] = "L#{symbol}1"
    outputTransition[state][symbol] = lambda {|state, symbol|
      $buffer["next"] = case symbol
                        when "4" then "ㄱ"
                        when "5" then "ㄴ"
                        when "6" then "ㄷ"
                        when "7" then "ㅂ"
                        when "8" then "ㅅ"
                        when "9" then "ㅈ"
                        when "0" then "ㅇ"
                        end
    }
  end
  # Default behavior. Will be overwritten.
  (lStates.reject {|v| v[1] == symbol} + l2States.reject {|v| v[3] == symbol}).each do |state|
    transition[state][symbol] = "F#{symbol}"
    outputTransition[state][symbol] = lambda {|state, symbol|
      case $buffer["next"]
      when "ㄸ", "ㅃ", "ㅉ"
        $result += elementsToChar($buffer)
        tmp = $buffer["next"]
        $buffer.clear
        $buffer["first"] = tmp
      else
        if $buffer["last"].nil?
          $buffer["last"] = $buffer["next"]
        else
          case state
          when "L4181"
            $buffer["last"] = "ㄳ"
          when "L5182"
            $buffer["last"] = "ㄶ"
          when "L5191"
            $buffer["last"] = "ㄵ"
          when "L5241"
            $buffer["last"] = "ㄺ"
          when "L5262"
            $buffer["last"] = "ㄾ"
          when "L5271"
            $buffer["last"] = "ㄼ"
          when "L5272"
            $buffer["last"] = "ㄿ"
          when "L5281"
            $buffer["last"] = "ㄽ"
          when "L5282"
            $buffer["last"] = "ㅀ"
          when "L5202"
            $buffer["last"] = "ㄻ"
          else
            $result += elementsToChar($buffer)
            tmp = $buffer["next"]
            $buffer.clear
            $buffer["first"] = tmp
          end
        end
      end
      $result += elementsToChar($buffer)
      $buffer.clear
      $buffer["first"] = case symbol
                         when "4" then "ㄱ"
                         when "5" then "ㄴ"
                         when "6" then "ㄷ"
                         when "7" then "ㅂ"
                         when "8" then "ㅅ"
                         when "9" then "ㅈ"
                         when "0" then "ㅇ"
                         end
    }
  end
  transition["L#{symbol}1"][symbol] = "L#{symbol}2"
  outputTransition["L#{symbol}1"][symbol] = lambda {|state, symbol|
    $buffer["next"] = case $buffer["next"]
                      when "ㄱ" then "ㅋ"
                      when "ㄴ" then "ㄹ"
                      when "ㄷ" then "ㅌ"
                      when "ㅂ" then "ㅍ"
                      when "ㅅ" then "ㅎ"
                      when "ㅈ" then "ㅊ"
                      when "ㅇ" then "ㅁ"
                      end
  }
end
"46789".chars.each do |symbol|
  transition["L#{symbol}2"][symbol] = "L#{symbol}3"
  outputTransition["L#{symbol}2"][symbol] = lambda {|state, symbol|
    $buffer["next"] = case $buffer["next"]
                      when "ㅋ" then "ㄲ"
                      when "ㅌ" then "ㄸ"
                      when "ㅍ" then "ㅃ"
                      when "ㅎ" then "ㅆ"
                      when "ㅊ" then "ㅉ"
                      end
  }
  transition["L#{symbol}3"][symbol] = "L#{symbol}1"
  outputTransition["L#{symbol}3"][symbol] = lambda {|state, symbol|
    $buffer["next"] = case $buffer["next"]
                      when "ㄲ" then "ㄱ"
                      when "ㄸ" then "ㄷ"
                      when "ㅃ" then "ㅂ"
                      when "ㅆ" then "ㅅ"
                      when "ㅉ" then "ㅈ"
                      end
  }
end
"50".chars.each do |symbol|
  transition["L#{symbol}2"][symbol] = "L#{symbol}1"
  outputTransition["L#{symbol}2"][symbol] = lambda {|state, symbol|
    $buffer["next"] = case $buffer["next"]
                      when "ㄹ" then "ㄴ"
                      when "ㅁ" then "ㅇ"
                      end
  }
end
# Overwriting default behavior.
l2States.map {|v| v[0..3]}.uniq.each do |state|
  prev_state = state[0..2]
  symbol = state[3]
  transition[prev_state][symbol] = state + "1"
  outputTransition[prev_state][symbol] = lambda {|state, symbol|
    $buffer["last"], $buffer["next"] = case state[1..2]
                                       when "41" then ["ㄱ", "ㅅ"] # ㄱ
                                       when "51" # ㄴ
                                         case symbol
                                         when "8" then ["ㄴ", "ㅅ"]
                                         when "9" then ["ㄴ", "ㅈ"]
                                         end
                                       when "52" # ㄹ
                                         case symbol
                                         when "4" then ["ㄹ", "ㄱ"]
                                         when "6" then ["ㄹ", "ㄷ"]
                                         when "7" then ["ㄹ", "ㅂ"]
                                         when "8" then ["ㄹ", "ㅅ"]
                                         when "0" then ["ㄹ", "ㅇ"]
                                         end
                                       when "71" then ["ㅂ", "ㅅ"] # ㅂ
                                       end
  }
  transition[state + "1"][symbol] = state + "2"
  outputTransition[state + "1"][symbol] = lambda {|state, symbol|
    $buffer["next"] = case state[1..2]
                      when "41" then "ㅎ" # ㄱ
                      when "51" # ㄴ
                        case symbol
                        when "8" then "ㅎ"
                        when "9" then "ㅊ"
                        end
                      when "52" # ㄹ
                        case symbol
                        when "4" then "ㅋ"
                        when "6" then "ㅌ"
                        when "7" then "ㅍ"
                        when "8" then "ㅎ"
                        when "0" then "ㅁ"
                        end
                      when "71" then "ㅎ" # ㅂ
                      end
  }
  if symbol == "0"
    transition[state + "2"][symbol] = state + "1"
    outputTransition[state + "2"][symbol] = lambda {|state, symbol|
      $buffer["next"] = "ㅇ"
    }
  else
    transition[state + "2"][symbol] = state + "3"
    outputTransition[state + "2"][symbol] = lambda {|state, symbol|
      $buffer["next"] = case state[1..2]
                        when "41" then "ㅆ" # ㄱ
                        when "51" # ㄴ
                          case symbol
                          when "8" then "ㅆ"
                          when "9" then "ㅉ"
                          end
                        when "52" # ㄹ
                          case symbol
                          when "4" then "ㄲ"
                          when "6" then "ㄸ"
                          when "7" then "ㅃ"
                          when "8" then "ㅆ"
                          end
                        when "71" then "ㅆ" # ㅂ
                        end
    }
    transition[state + "3"][symbol] = state + "1"
    outputTransition[state + "3"][symbol] = lambda {|state, symbol|
      $buffer["next"] = case state[1..2]
                        when "41" then "ㅅ" # ㄱ
                        when "51" # ㄴ
                          case symbol
                          when "8" then "ㅅ"
                          when "9" then "ㅈ"
                          end
                        when "52" # ㄹ
                          case symbol
                          when "4" then "ㄱ"
                          when "6" then "ㄷ"
                          when "7" then "ㅂ"
                          when "8" then "ㅅ"
                          end
                        when "71" then "ㅅ" # ㅂ
                        end
    }
  end
end
"123".chars.each do |symbol|
  lStates.each do |state|
    transition[state][symbol] = case symbol
                                when "1" then "MI"
                                when "2" then "M."
                                when "3" then "MEU"
                                end
    outputTransition[state][symbol] = lambda {|state, symbol|
      $result += elementsToChar($buffer)
      tmp = $buffer["next"]
      $buffer.clear
      $buffer["first"] = tmp
      $buffer["middle"] = case symbol
                          when "1" then "ㅣ"
                          when "2" then "·"
                          when "3" then "ㅡ"
                          end
    }
  end
  l2States.each do |state|
    transition[state][symbol] = case symbol
                                when "1" then "MI"
                                when "2" then "M."
                                when "3" then "MEU"
                                end
    outputTransition[state][symbol] = lambda {|state, symbol|
      $result += elementsToChar($buffer)
      tmp = $buffer["next"]
      $buffer.clear
      $buffer["first"] = tmp
      $buffer["middle"] = case symbol
                          when "1" then "ㅣ"
                          when "2" then "·"
                          when "3" then "ㅡ"
                          end
    }
  end
end

outputs = outputTransition.values.map(&:values).reduce(:+)
stateTransitionFunction = StateTransitionFunction.new(transition)
outputFunction = StateTransitionFunction.new(outputTransition)
initialState = "S"

def delTransitionFunction
  if $buffer["first"].nil?
    $result = $result[0...-1]
    "S"
  elsif $buffer["middle"].nil?
    $buffer["first"] = nil
    "S"
  elsif $buffer["next"].nil?
    case $buffer["middle"]
    when "ㅘ", "ㅙ", "ㅚ"
      $buffer["middle"] = "ㅗ"
      "MO"
    when "ㅝ", "ㅞ", "ㅟ"
      $buffer["middle"] = "ㅜ"
      "MU"
    when "ㅢ"
      $buffer["middle"] = "ㅡ"
      "MEU"
    else
      $buffer["middle"] = nil
      case $buffer["first"]
      when "ㄱ", "ㅋ", "ㄲ" then "F4"
      when "ㄴ", "ㄹ" then "F5"
      when "ㄷ", "ㅌ", "ㄸ" then "F6"
      when "ㅂ", "ㅍ", "ㅃ" then "F7"
      when "ㅅ", "ㅎ", "ㅆ" then "F8"
      when "ㅈ", "ㅊ", "ㅉ" then "F9"
      when "ㅇ", "ㅁ" then "F0"
      end
    end
  else
    $buffer["next"] = $buffer["last"]
    $buffer["last"] = nil
    case $buffer["next"]
    when "ㄱ" then "L41"
    when "ㄴ" then "L51"
    when "ㄹ" then "L52"
    when "ㅂ" then "L71"
    else
      case $buffer["middle"]
      when "ㅏ", "ㅑ" then "MA"
      when "ㅓ", "ㅕ", "ㅘ", "ㅝ" then "MEO"
      when "ㅗ" then "MO"
      when "ㅚ" then "MOI"
      when "ㅜ" then "MU"
      when "ㅠ" then "MYU"
      when "ㅡ" then "MEU"
      when "ㅣ" then "MI"
      else "ML"
      end
    end
  end
end

hanguelPhoneJong = HangeulAutomata.new(states, symbols, outputs, stateTransitionFunction, outputFunction, initialState, method(:delTransitionFunction))
hanguelPhoneJong.run
