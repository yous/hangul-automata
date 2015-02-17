# encoding: utf-8
require 'pre_project2.1/pre_project2.1'
require 'project1/project1'
require 'final_project/final_project'
require 'final_project/phoneRegex.tab'

# ㄱㅋㄲㄴㄹㄷㅌㄸㅂㅍㅃㅅㅎㅆㅈㅊㅉㅇㅁ
cho = ["(444)*4", "(444)*44", "(444)*444", "(55)*5", "(55)*55", "(666)*6", "(666)*66", "(666)*666", "(777)*7", "(777)*77", "(777)*777", "(888)*8", "(888)*88", "(888)*888", "(999)*9", "(999)*99", "(999)*999", "(00)*0", "(00)*00"].join("|")
# ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ
jung = ["1(22)*2", "1(22)*21", "1(22)*22", "1(22)*221", "(22)*21", "(22)*211", "(22)*221", "(22)*2211", "(22)*23", "(22)*2312", "(22)*23121", "(22)*231", "(22)*223", "3(22)*2", "3(22)*221", "3(22)*2211", "3(22)*21", "3(22)*22", "3", "31", "1"].join("|")
# ㄱㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅇㅈㅊㅋㅌㅍㅎㄲㅆ
jong = ["(444)*4", "(444)*4(888)*8", "(55)*5", "(55)*5(999)*9", "(55)*5(888)*88", "(666)*6", "(55)*55", "(55)*55(444)*4", "(55)*55(00)*00", "(55)*55(777)*7", "(55)*55(888)*8", "(55)*55(666)*66", "(55)*55(777)*77", "(55)*55(888)*88", "(00)*00", "(777)*7", "(777)*7(888)*8", "(888)*8", "(00)*0", "(999)*9", "(999)*99", "(444)*44", "(666)*66", "(777)*77", "(888)*88", "(444)*444", "(888)*888"].join("|")
# .,?!<Space>
etc = ["(....)*.", "(....)*..", "(....)*...", "(....)*....", "#"].join("|")

regex = RegularExpression.new
hangeulRegex = "((#{cho})(#{jung})|(#{cho})(#{jung})(#{jong})|(#{etc}))*"
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
