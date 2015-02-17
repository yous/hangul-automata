class RegularExpression
macro
  BLANK \s+
  EPSILON <e>
  SYMBOL [a-zA-Z]
rule
  {BLANK}
  {EPSILON} { [:SYMBOL, nil] }
  {SYMBOL} { [:SYMBOL, qwertyToHangeul(text)] }
  \||\*|\(|\) { [text, text] }
inner
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
    hanguel[qwerty.index(char)]
  end
end
