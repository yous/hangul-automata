# encoding: utf-8
require 'project1/project1'
require 'final_project/final_project'

states = ["q0", "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10", "q11", "q12", "q13", "q14", "q15", "q16", "q17", "q18", "q19", "q20", "q21", "q22", "q23", "q24", "q25", "q26", "q27", "q28", "q29", "q30", "q31", "q32", "q33", "q34", "q35", "q36", "q37", "q38", "q39", "q40", "q41", "q42", "q43", "q44", "q45", "q46", "q47", "q48", "q49", "q50", "q51", "q52", "q53", "q54", "q55"]
symbols = ["4", "5", "6", "7", "8", "9", "0", "1", "2", "3", ".", "#"]
stateTransition = {
  "q0" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q5",
    "9" => "q6",
    "0" => "q7",
    "1" => "q8",
    "2" => "q8",
    "3" => "q8",
    "." => "q0",
    "#" => "q0"
  },
  "q1" => {
    "4" => "q1",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q2" => {
    "4" => "q8",
    "5" => "q2",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q3" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q3",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q4" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q4",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q5" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q5",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q6" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q6",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q7" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q8" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q8",
    "2" => "q8",
    "3" => "q8",
    "." => "q8",
    "#" => "q8"
  },
  "q9" => {
    "4" => "q12",
    "5" => "q13",
    "6" => "q14",
    "7" => "q15",
    "8" => "q16",
    "9" => "q17",
    "0" => "q18",
    "1" => "q8",
    "2" => "q19",
    "3" => "q8",
    "." => "q0",
    "#" => "q0"
  },
  "q10" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q20",
    "2" => "q21",
    "3" => "q22",
    "." => "q8",
    "#" => "q8"
  },
  "q11" => {
    "4" => "q12",
    "5" => "q13",
    "6" => "q14",
    "7" => "q15",
    "8" => "q16",
    "9" => "q17",
    "0" => "q18",
    "1" => "q23",
    "2" => "q24",
    "3" => "q8",
    "." => "q0",
    "#" => "q0"
  },
  "q12" => {
    "4" => "q25",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q26",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q13" => {
    "4" => "q1",
    "5" => "q27",
    "6" => "q3",
    "7" => "q4",
    "8" => "q28",
    "9" => "q29",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q14" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q30",
    "7" => "q4",
    "8" => "q5",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q15" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q31",
    "8" => "q26",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q16" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q16",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q17" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q5",
    "9" => "q32",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q18" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q5",
    "9" => "q6",
    "0" => "q18",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q19" => {
    "4" => "q12",
    "5" => "q13",
    "6" => "q14",
    "7" => "q15",
    "8" => "q16",
    "9" => "q17",
    "0" => "q18",
    "1" => "q23",
    "2" => "q19",
    "3" => "q8",
    "." => "q0",
    "#" => "q0"
  },
  "q20" => {
    "4" => "q12",
    "5" => "q13",
    "6" => "q14",
    "7" => "q15",
    "8" => "q16",
    "9" => "q17",
    "0" => "q18",
    "1" => "q23",
    "2" => "q8",
    "3" => "q8",
    "." => "q0",
    "#" => "q0"
  },
  "q21" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q20",
    "2" => "q10",
    "3" => "q23",
    "." => "q8",
    "#" => "q8"
  },
  "q22" => {
    "4" => "q12",
    "5" => "q13",
    "6" => "q14",
    "7" => "q15",
    "8" => "q16",
    "9" => "q17",
    "0" => "q18",
    "1" => "q33",
    "2" => "q8",
    "3" => "q8",
    "." => "q0",
    "#" => "q0"
  },
  "q23" => {
    "4" => "q12",
    "5" => "q13",
    "6" => "q14",
    "7" => "q15",
    "8" => "q16",
    "9" => "q17",
    "0" => "q18",
    "1" => "q8",
    "2" => "q8",
    "3" => "q8",
    "." => "q0",
    "#" => "q0"
  },
  "q24" => {
    "4" => "q12",
    "5" => "q13",
    "6" => "q14",
    "7" => "q15",
    "8" => "q16",
    "9" => "q17",
    "0" => "q18",
    "1" => "q23",
    "2" => "q34",
    "3" => "q8",
    "." => "q0",
    "#" => "q0"
  },
  "q25" => {
    "4" => "q35",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q5",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q26" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q36",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q27" => {
    "4" => "q37",
    "5" => "q13",
    "6" => "q38",
    "7" => "q39",
    "8" => "q40",
    "9" => "q6",
    "0" => "q41",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q28" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q26",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q29" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q5",
    "9" => "q42",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q30" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q43",
    "7" => "q4",
    "8" => "q5",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q31" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q44",
    "8" => "q5",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q32" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q5",
    "9" => "q45",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q33" => {
    "4" => "q12",
    "5" => "q13",
    "6" => "q14",
    "7" => "q15",
    "8" => "q16",
    "9" => "q17",
    "0" => "q18",
    "1" => "q8",
    "2" => "q20",
    "3" => "q8",
    "." => "q0",
    "#" => "q0"
  },
  "q34" => {
    "4" => "q12",
    "5" => "q13",
    "6" => "q14",
    "7" => "q15",
    "8" => "q16",
    "9" => "q17",
    "0" => "q18",
    "1" => "q20",
    "2" => "q24",
    "3" => "q8",
    "." => "q0",
    "#" => "q0"
  },
  "q35" => {
    "4" => "q12",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q5",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q36" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q28",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q37" => {
    "4" => "q46",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q5",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q38" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q47",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q39" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q48",
    "8" => "q5",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q40" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q49",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q41" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q50",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q42" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q51",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q43" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q14",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q44" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q15",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q45" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q17",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q46" => {
    "4" => "q52",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q47" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q53",
    "7" => "q4",
    "8" => "q5",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q48" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q54",
    "8" => "q5",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q49" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q55",
    "9" => "q6",
    "0" => "q7",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q50" => {
    "4" => "q1",
    "5" => "q2",
    "6" => "q3",
    "7" => "q4",
    "8" => "q5",
    "9" => "q6",
    "0" => "q41",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q0",
    "#" => "q0"
  },
  "q51" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q29",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q52" => {
    "4" => "q37",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q53" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q38",
    "7" => "q8",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q54" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q39",
    "8" => "q8",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  },
  "q55" => {
    "4" => "q8",
    "5" => "q8",
    "6" => "q8",
    "7" => "q8",
    "8" => "q40",
    "9" => "q8",
    "0" => "q8",
    "1" => "q9",
    "2" => "q10",
    "3" => "q11",
    "." => "q8",
    "#" => "q8"
  }
}
initialState = "q0"
finalStates = ["q0", "q9", "q11", "q12", "q13", "q14", "q15", "q16", "q17", "q18", "q19", "q20", "q22", "q23", "q24", "q25", "q26", "q27", "q29", "q30", "q31", "q32", "q33", "q34", "q35", "q37", "q39", "q40", "q47", "q48", "q49", "q50"]

=begin
q0: Initial state
q1: ㄱ, ㅋ, ㄲ
q2: ㄴ, ㄹ
q3: ㄷ, ㅌ, ㄸ
q4: ㅂ, ㅍ, ㅃ
q5: ㅅ, ㅎ, ㅆ
q6: ㅈ, ㅊ, ㅉ
q7: ㅇ, ㅁ
q8: Dead state
q9: 초성 + ㅣ
q10: 초성 + ·
q11: 초성 + ㅡ
q12: 초성 + 중성 + ㄱ
q13: 초성 + 중성 + ㄴ
q14: 초성 + 중성 + ㄷ
q15: 초성 + 중성 + ㅂ
q16: 초성 + 중성 + ㅅ, ㅎ, ㅆ
q17: 초성 + 중성 + ㅈ
q18: 초성 + 중성 + ㅇ, ㅁ
q19: 초성 + ㅏ, ㅑ
q20: 초성 + ㅓ, ㅕ, ㅘ, ㅝ
q21: 초성 + ··
q22: 초성 + ㅗ
q23: 초성 + 중성
q24: 초성 + ㅜ
q25: 초성 + 중성 + ㅋ
q26: 초성 + 중성 + ㄳ, ㄶ, ㅄ
q27: 초성 + 중성 + ㄹ
q28: 초성 + 중성 + ㄱㅆ, ㄴㅅ, ㅂㅆ
q29: 초성 + 중성 + ㄵ
q30: 초성 + 중성 + ㅌ
q31: 초성 + 중성 + ㅍ
q32: 초성 + 중성 + ㅊ
q33: 초성 + ㅚ
q34: 초성 + ㅠ
q35: 초성 + 중성 + ㄲ
q36: 초성 + 중성 + ㄱㅎ, ㄴㅆ, ㅂㅎ
q37: 초성 + 중성 + ㄺ
q38: 초성 + 중성 + ㄹㄷ
q39: 초성 + 중성 + ㄼ
q40: 초성 + 중성 + ㄽ
q41: 초성 + 중성 + ㄹㅇ
q42: 초성 + 중성 + ㄴㅊ
q43: 초성 + 중성 + ㄸ
q44: 초성 + 중성 + ㅃ
q45: 초성 + 중성 + ㅉ
q46: 초성 + 중성 + ㄹㅋ
q47: 초성 + 중성 + ㄾ
q48: 초성 + 중성 + ㄿ
q49: 초성 + 중성 + ㅀ
q50: 초성 + 중성 + ㄻ
q51: 초성 + 중성 + ㄴㅉ
q52: 초성 + 중성 + ㄹㄲ
q53: 초성 + 중성 + ㄹㄸ
q54: 초성 + 중성 + ㄹㅃ
q55: 초성 + 중성 + ㄹㅆ
=end

aliases = {
  "1" => "ㅣ",
  "2" => "·",
  "3" => "ㅡ",
  "4" => "ㄱ",
  "5" => "ㄴ",
  "6" => "ㄷ",
  "7" => "ㅂ",
  "8" => "ㅅ",
  "9" => "ㅈ",
  "0" => "ㅇ",
  "." => ".",
  "#" => " "
}
rotates = {
  "·" => "··",
  "··" => "·",
  "ㄱ" => "ㅋ",
  "ㅋ" => "ㄲ",
  "ㄲ" => "ㄱ",
  "ㄴ" => "ㄹ",
  "ㄹ" => "ㄴ",
  "ㄷ" => "ㅌ",
  "ㅌ" => "ㄸ",
  "ㄸ" => "ㄷ",
  "ㅂ" => "ㅍ",
  "ㅍ" => "ㅃ",
  "ㅃ" => "ㅂ",
  "ㅅ" => "ㅎ",
  "ㅎ" => "ㅆ",
  "ㅆ" => "ㅅ",
  "ㅈ" => "ㅊ",
  "ㅊ" => "ㅉ",
  "ㅉ" => "ㅈ",
  "ㅇ" => "ㅁ",
  "ㅁ" => "ㅇ",
  "." => ",",
  "," => "?",
  "?" => "!",
  "!" => "."
}

outputTransition = Hash.new
states.each do |state|
  outputTransition[state] = Hash.new
end
# *, # (q0, q9, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q22, q23, q24, q25, q26, q27, q29, q30, q31, q32, q33, q34, q35, q37, q39, q40, q47, q48, q49, q50 => q0)
outputTransition["q0"]["."] = lambda {|state, symbol|
  $buffer["first"] = case $buffer["first"]
                     when nil then aliases[symbol]
                     else rotates[$buffer["first"]]
                     end
}
outputTransition["q0"]["#"] = lambda {|state, symbol|
  case $buffer["first"]
  when nil
    $result += " "
  else
    $result += elementsToChar($buffer)
    $buffer.clear
  end
}
["q9", "q11", "q12", "q13", "q14", "q15", "q16", "q17", "q18", "q19", "q20", "q22", "q23", "q24", "q25", "q26", "q27", "q29", "q30", "q31", "q32", "q33", "q34", "q35", "q37", "q39", "q40", "q47", "q48", "q49", "q50"].each do |state|
  outputTransition[state]["."] = lambda {|state, symbol|
    $buffer["last"] = case $buffer["last"]
                      when "ㄱ" then "ㄳ"
                      when "ㄴ"
                        case $buffer["next"]
                        when "ㅈ" then "ㄵ"
                        when "ㅎ" then "ㄶ"
                        end
                      when "ㄹ"
                        case $buffer["next"]
                        when "ㄱ" then "ㄺ"
                        when "ㅁ" then "ㄻ"
                        when "ㅂ" then "ㄼ"
                        when "ㅅ" then "ㄽ"
                        when "ㅌ" then "ㄾ"
                        when "ㅍ" then "ㄿ"
                        when "ㅎ" then "ㅀ"
                        end
                      when "ㅂ" then "ㅄ"
                      else $buffer["next"]
                      end
    $result += elementsToChar($buffer)
    $buffer.clear
    $buffer["first"] = aliases[symbol]
  }
  outputTransition[state]["#"] = lambda {|state, symbol|
    $buffer["last"] = case $buffer["last"]
                      when "ㄱ" then "ㄳ"
                      when "ㄴ"
                        case $buffer["next"]
                        when "ㅈ" then "ㄵ"
                        when "ㅎ" then "ㄶ"
                        end
                      when "ㄹ"
                        case $buffer["next"]
                        when "ㄱ" then "ㄺ"
                        when "ㅁ" then "ㄻ"
                        when "ㅂ" then "ㄼ"
                        when "ㅅ" then "ㄽ"
                        when "ㅌ" then "ㄾ"
                        when "ㅍ" then "ㄿ"
                        when "ㅎ" then "ㅀ"
                        end
                      when "ㅂ" then "ㅄ"
                      else $buffer["next"]
                      end
    $result += elementsToChar($buffer)
    $buffer.clear
  }
end
# 초성 (q0 => q1, q2, q3, q4, q5, q6, q7)
stateTransition["q0"].select {|key, val| ["q1", "q2", "q3", "q4", "q5", "q6", "q7"].include? val}.keys.each do |symbol|
  outputTransition["q0"][symbol] = lambda {|state, symbol|
    $result += elementsToChar($buffer)
    $buffer.clear
    $buffer["first"] = aliases[symbol]
  }
end
# 초성 반복 (q1, q2, q3, q4, q5, q6, q7)
["q1", "q2", "q3", "q4", "q5", "q6", "q7"].each do |state|
  stateTransition[state].select {|key, val| val == state}.keys.each do |symbol|
    outputTransition[state][symbol] = lambda {|state, symbol|
      $buffer["first"] = rotates[$buffer["first"]]
    }
  end
end
# 초성 + 중성 (q1, q2, q3, q4, q5, q6, q7 => q9, q10, q11)
["q1", "q2", "q3", "q4", "q5", "q6", "q7"].each do |state|
  stateTransition[state].select {|key, val| ["q9", "q10", "q11"].include? val}.keys.each do |symbol|
    outputTransition[state][symbol] = lambda {|state, symbol|
      $buffer["middle"] = aliases[symbol]
    }
  end
end
# 초성 + ㅣ + · (q9 => q19)
outputTransition["q9"]["2"] = lambda {|state, symbol|
  $buffer["middle"] = "ㅏ"
}
# 초성 + · + ㅣ, ·, ㅡ (q10 => q20, q21, q22)
stateTransition["q10"].select {|key, val| ["q20", "q21", "q22"].include? val}.keys.each do |symbol|
  outputTransition["q10"][symbol] = lambda {|state, symbol|
    $buffer["middle"] = case symbol
                        when "1" then "ㅓ"
                        when "2" then "··"
                        when "3" then "ㅗ"
                        end
  }
end
# 초성 + ㅡ + ㅣ, · (q11 => q23, q24)
stateTransition["q11"].select {|key, val| ["q23", "q24"].include? val}.keys.each do |symbol|
  outputTransition["q11"][symbol] = lambda {|state, symbol|
    $buffer["middle"] = case symbol
                        when "1" then "ㅢ"
                        when "2" then "ㅜ"
                        end
  }
end
# 초성 + ㅏ, ㅑ + ㅣ, · (q19 => q23)
outputTransition["q19"]["1"] = lambda {|state, symbol|
  $buffer["middle"] = case $buffer["middle"]
                      when "ㅏ" then "ㅐ"
                      when "ㅑ" then "ㅒ"
                      end
}
# 초성 + ㅏ, ㅑ + · (q19)
outputTransition["q19"]["2"] = lambda {|state, symbol|
  $buffer["middle"] = case $buffer["middle"]
                      when "ㅏ" then "ㅑ"
                      when "ㅑ" then "ㅏ"
                      end
}
# 초성 + ㅓ, ㅕ, ㅘ, ㅝ + ㅣ (q20 => q23)
outputTransition["q20"]["1"] = lambda {|state, symbol|
  $buffer["middle"] = case $buffer["middle"]
                      when "ㅓ" then "ㅔ"
                      when "ㅕ" then "ㅖ"
                      when "ㅘ" then "ㅙ"
                      when "ㅝ" then "ㅞ"
                      end
}
# 초성 + ·· + ㅣ, ·, ㅡ (q21 => q20, q10, q23)
stateTransition["q21"].select {|key, val| ["q20", "q10", "q23"].include? val}.keys.each do |symbol|
  outputTransition["q21"][symbol] = lambda {|state, symbol|
    $buffer["middle"] = case symbol
                        when "1" then "ㅕ"
                        when "2" then "·"
                        when "3" then "ㅛ"
                        end
  }
end
# 초성 + ㅗ + ㅣ (q22 => q33)
outputTransition["q22"]["1"] = lambda {|state, symbol|
  $buffer["middle"] = "ㅚ"
}
# 초성 + ㅜ + ㅣ (q24 => q23)
outputTransition["q24"]["1"] = lambda {|state, symbol|
  $buffer["middle"] = "ㅟ"
}
# 초성 + ㅜ + · (q24 => q34)
outputTransition["q24"]["2"] = lambda {|state, symbol|
  $buffer["middle"] = "ㅠ"
}
# 초성 + ㅚ + · (q33 => q20)
outputTransition["q33"]["2"] = lambda {|state, symbol|
  $buffer["middle"] = "ㅘ"
}
# 초성 + ㅠ + ㅣ, · (q34 => q20, q24)
stateTransition["q34"].select {|key, val| ["q20", "q24"].include? val}.keys.each do |symbol|
  outputTransition["q34"][symbol] = lambda {|state, symbol|
    $buffer["middle"] = case symbol
                        when "1" then "ㅝ"
                        when "2" then "ㅜ"
                        end
  }
end
# 초성 + 중성 + 종성 (q9, q11, q19, q20, q22, q23, q24, q33, q34 => q12, q13, q14, q15, q16, q17, q18)
["q9", "q11", "q19", "q20", "q22", "q23", "q24", "q33", "q34"].each do |state|
  stateTransition[state].select {|key, val| ["q12", "q13", "q14", "q15", "q16", "q17", "q18"].include? val}.keys.each do |symbol|
    outputTransition[state][symbol] = lambda {|state, symbol|
      $buffer["next"] = aliases[symbol]
    }
  end
end
# 초성 + 중성 + ㄱ, ㅋ, ㄲ 반복 (q12 => q25 => q35 => q12)
["q12", "q25", "q35"].each do |state|
  outputTransition[state]["4"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + ㄴ, ㅎ 반복 (q13 => q27 => q13)
["q13", "q27"].each do |state|
  outputTransition[state]["5"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + ㄷ, ㅌ, ㄸ 반복 (q14 => q30 => q43 => q14)
["q14", "q30", "q43"].each do |state|
  outputTransition[state]["6"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + ㅂ, ㅍ, ㅃ 반복 (q15 => q31 => q44 => q15)
["q15", "q31", "q44"].each do |state|
  outputTransition[state]["7"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + ㅅ, ㅎ, ㅆ 반복 (q16)
outputTransition["q16"]["8"] = lambda {|state, symbol|
  $buffer["next"] = rotates[$buffer["next"]]
}
# 초성 + 중성 + ㅈ, ㅊ, ㅉ 반복 (q17 => q32 => q45 => q17)
["q17", "q32", "q45"].each do |state|
  outputTransition[state]["9"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + ㅇ, ㅁ 반복 (q18)
outputTransition["q18"]["0"] = lambda {|state, symbol|
  $buffer["next"] = rotates[$buffer["next"]]
}
# 초성 + 중성 + ㄱ, ㅂ + ㅅ (q12, q15 => q26)
["q12", "q15"].each do |state|
  outputTransition[state]["8"] = lambda {|state, symbol|
    $buffer["last"] = $buffer["next"]
    $buffer["next"] = aliases[symbol]
  }
end
# 초성 + 중성 + ㄴ + ㅅ (q13 => q28)
outputTransition["q13"]["8"] = lambda {|state, symbol|
  $buffer["last"] = $buffer["next"]
  $buffer["next"] = aliases[symbol]
}
# 초성 + 중성 + (ㄳ, ㄶ, ㅄ), (ㄱㅎ, ㄴㅆ, ㅂㅎ), (ㄱㅆ, ㄴㅅ, ㅂㅆ) 반복 (q26 => q36 => q28 => q26)
["q26", "q36", "q28"].each do |state|
  outputTransition[state]["8"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + ㄴ + ㅈ (q13 => q29)
outputTransition["q13"]["9"] = lambda {|state, symbol|
  $buffer["last"] = $buffer["next"]
  $buffer["next"] = aliases[symbol]
}
# 초성 + 중성 + ㄵ, ㄴㅊ, ㄴㅉ 반복 (q29 => q42 => q51 => q29)
["q29", "q42", "q51"].each do |state|
  outputTransition[state]["9"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + ㄹ + ㄱ (q27 => q37)
outputTransition["q27"]["4"] = lambda {|state, symbol|
  $buffer["last"] = $buffer["next"]
  $buffer["next"] = aliases[symbol]
}
# 초성 + 중성 + ㄺ, ㄹㅋ, ㄹㄲ 반복 (q37 => q46 => q52 => q37)
["q37", "q46", "q52"].each do |state|
  outputTransition["q37"]["4"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + ㄹ + ㄷ (q27 => q38)
outputTransition["q27"]["6"] = lambda {|state, symbol|
  $buffer["last"] = $buffer["next"]
  $buffer["next"] = aliases[symbol]
}
# 초성 + 중성 + ㄹㄷ, ㄾ, ㄹㄸ 반복 (q38 => q47 => q53 => q38)
["q38", "q47", "q53"].each do |state|
  outputTransition[state]["6"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + ㄹ + ㅂ (q27 => q39)
outputTransition["q27"]["7"] = lambda {|state, symbol|
  $buffer["last"] = $buffer["next"]
  $buffer["next"] = aliases[symbol]
}
# 초성 + 중성 + ㄼ, ㄿ, ㄹㅃ 반복 (q39 => q48 => q54 => q39)
["q39", "q48", "q54"].each do |state|
  outputTransition[state]["7"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + ㄹ + ㅅ (q27 => q40)
outputTransition["q27"]["8"] = lambda {|state, symbol|
  $buffer["last"] = $buffer["next"]
  $buffer["next"] = aliases[symbol]
}
# 초성 + 중성 + ㄽ, ㅀ, ㄹㅆ 반복 (q40 => q49 => q55 => q40)
["q40", "q49", "q55"].each do |state|
  outputTransition[state]["8"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + ㄹ + ㅇ (q27 => q41)
outputTransition["q27"]["0"] = lambda {|state, symbol|
  $buffer["last"] = $buffer["next"]
  $buffer["next"] = aliases[symbol]
}
# 초성 + 중성 + ㄹㅇ, ㄻ 반복 (q41 => q50 => q41)
["q41", "q50"].each do |state|
  outputTransition[state]["0"] = lambda {|state, symbol|
    $buffer["next"] = rotates[$buffer["next"]]
  }
end
# 초성 + 중성 + 종성 + 초성 (q12, q13, q14, q15, q16, q17, q18, q25, q26, q27, q29, q30, q31, q32, q35, q37, q39, q40, q47, q48, q49, q50 => q1, q2, q3, q4, q5, q6, q7)
["q12", "q13", "q14", "q15", "q16", "q17", "q18", "q25", "q26", "q27", "q29", "q30", "q31", "q32", "q35", "q37", "q39", "q40", "q47", "q48", "q49", "q50"].each do |state|
  stateTransition[state].select {|key, val| ["q1", "q2", "q3", "q4", "q5", "q6", "q6"].include? val}.keys.each do |symbol|
    outputTransition[state][symbol] = lambda {|state, symbol|
      $buffer["last"] = case $buffer["last"]
                        when "ㄱ" then "ㄳ"
                        when "ㄴ"
                          case $buffer["next"]
                          when "ㅈ" then "ㄵ"
                          when "ㅎ" then "ㄶ"
                          end
                        when "ㄹ"
                          case $buffer["next"]
                          when "ㄱ" then "ㄺ"
                          when "ㅁ" then "ㄻ"
                          when "ㅂ" then "ㄼ"
                          when "ㅅ" then "ㄽ"
                          when "ㅌ" then "ㄾ"
                          when "ㅍ" then "ㄿ"
                          when "ㅎ" then "ㅀ"
                          end
                        when "ㅂ" then "ㅄ"
                        else $buffer["next"]
                        end
      $result += elementsToChar($buffer)
      $buffer.clear
      $buffer["first"] = aliases[symbol]
    }
  end
end
# 초성 + 중성 + 종성 + 중성 (q12, q13, q14, q15, q16, q17, q18, q25, q26, q27, q29, q30, q31, q32, q35, q37, q39, q40, q47, q48, q49, q50 => q9, q10, q11)
["q12", "q13", "q14", "q15", "q16", "q17", "q18", "q25", "q26", "q27", "q29", "q30", "q31", "q32", "q35", "q37", "q39", "q40", "q47", "q48", "q49", "q50"].each do |state|
  stateTransition[state].select {|key, val| ["q9", "q10", "q11"].include? val}.keys.each do |symbol|
    outputTransition[state][symbol] = lambda {|state, symbol|
      tmp = $buffer["next"]
      $result += elementsToChar($buffer)
      $buffer.clear
      $buffer["first"] = tmp
      $buffer["middle"] = aliases[symbol]
    }
  end
end
# 초성 + 중성 + 종성 + 종성 + 중성 (q28, q36, q38, q41, q42, q43, q44, q45, q46, q51, q52, q53, q54, q55 => q9, q10, q11)
["q28", "q36", "q38", "q41", "q42", "q43", "q44", "q45", "q46", "q51", "q52", "q53", "q54", "q55"].each do |state|
  stateTransition[state].select {|key, val| ["q9", "q10", "q11"].include? val}.keys.each do |symbol|
    outputTransition[state][symbol] = lambda {|state, symbol|
      tmp = $buffer["next"]
      $result += elementsToChar($buffer)
      $buffer.clear
      $buffer["first"] = tmp
      $buffer["middle"] = aliases[symbol]
    }
  end
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
  elsif $buffer["next"].nil?
    case $buffer["middle"]
    when "ㅘ", "ㅙ", "ㅚ"
      $buffer["middle"] = "ㅗ"
      "q22"
    when "ㅝ", "ㅞ", "ㅟ"
      $buffer["middle"] = "ㅜ"
      "q24"
    when "ㅢ"
      $buffer["middle"] = "ㅡ"
      "q11"
    else
      $buffer["middle"] = nil
      case $buffer["first"]
      when "ㄱ", "ㅋ", "ㄲ" then "q1"
      when "ㄴ", "ㄹ" then "q2"
      when "ㄷ", "ㅌ", "ㄸ" then "q3"
      when "ㅂ", "ㅍ", "ㅃ" then "q4"
      when "ㅅ", "ㅎ", "ㅆ" then "q5"
      when "ㅈ", "ㅊ", "ㅉ" then "q6"
      when "ㅇ", "ㅁ" then "q7"
      end
    end
  else
    $buffer["next"] = $buffer["last"]
    $buffer["last"] = nil
    case $buffer["next"]
    when "ㄱ" then "q12"
    when "ㄴ" then "q13"
    when "ㄹ" then "q27"
    when "ㅂ" then "q15"
    else
      case $buffer["middle"]
      when "ㅏ", "ㅑ" then "q19"
      when "ㅓ", "ㅕ", "ㅘ", "ㅝ" then "q20"
      when "ㅗ" then "q22"
      when "ㅚ" then "q33"
      when "ㅜ" then "q24"
      when "ㅠ" then "q34"
      when "ㅡ" then "q11"
      when "ㅣ" then "q9"
      else "q23"
      end
    end
  end
end

hangeulPhoneCho = HangeulAutomata.new(states, symbols, outputs, stateTransitionFunction, outputFunction, initialState, method(:delTransitionFunction))
hangeulPhoneCho.run
