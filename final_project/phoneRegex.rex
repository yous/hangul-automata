class RegularExpression
macro
  BLANK \s+
  EPSILON <e>
  DIGIT \d
  SPECIAL [\.\#]
rule
  {BLANK}
  {EPSILON} { [:SYMBOL, nil] }
  {DIGIT} { [:SYMBOL, text] }
  {SPECIAL} { [:SYMBOL, text] }
  \||\*|\(|\) { [text, text] }
inner
end
