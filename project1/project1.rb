# encoding: utf-8
require 'pre_project1.2/pre_project1.2'

def getch
  state = `stty -g`
  begin
    `stty raw -echo cbreak`
    STDIN.getc
  ensure
    `stty #{state}`
  end
end

def qwertyToHangeul(char)
  qwerty = [
    "qwertyuiop",
    "asdfghjkl",
    "zxcvbnm",
    "QWERTYUIOP",
    "ASDFGHJKL",
    "ZXCVBNM"
  ].join.chars.to_a
  hanguel = [
    "ㅂㅈㄷㄱㅅㅛㅕㅑㅐㅔ",
    "ㅁㄴㅇㄹㅎㅗㅓㅏㅣ",
    "ㅋㅌㅊㅍㅠㅜㅡ",
    "ㅃㅉㄸㄲㅆㅛㅕㅑㅒㅖ",
    "ㅁㄴㅇㄹㅎㅗㅓㅏㅣ",
    "ㅋㅌㅊㅍㅠㅜㅡ"
  ].join.chars.to_a
  if qwerty.include? char
    hanguel[qwerty.index(char)]
  else
    char
  end
end

def elementsToChar(buffer)
  oC = "ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ".chars.to_a
  oV = "ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ".chars.to_a
  oL = [nil] + "ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ".chars.to_a
  if buffer["first"].nil?
    ""
  elsif buffer["middle"].nil?
    buffer["first"]
  elsif buffer["middle"] == "·" or buffer["middle"] == "··"
    buffer["first"] + buffer["middle"]
  else
    [44032 + (oC.index(buffer["first"]) * oV.length + oV.index(buffer["middle"])) * oL.length + oL.index(buffer["last"])].pack("U*")
  end
end

class HangeulAutomata
  def initialize(states, symbols, outputs, stateTransitionFunction, outputFunction, initialState, delTransitionFunction)
    @states = states
    @symbols = symbols
    @outputs = outputs
    @stateTransitionFunction = stateTransitionFunction
    @outputFunction = outputFunction
    @initialState = initialState
    @delTransitionFunction = delTransitionFunction
  end

  def run
    $result = ""
    $buffer = Hash.new
    state = @initialState
    begin
      symbol = qwertyToHangeul(getch)
      if symbol == "\u007F" # Backspace
        state = @delTransitionFunction.call
      else
        MealyMachineSimulator.new(@states, @symbols, @outputs, @stateTransitionFunction, @outputFunction, state).run([symbol])
        state = @stateTransitionFunction.transition(state, symbol)
      end
      break if state.nil?
      puts $result + elementsToChar($buffer) + ($buffer["next"].nil? ? "" : $buffer["next"])
    end until symbol == "\r" or symbol == "\e"
  end
end
