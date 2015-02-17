class RegularExpression
macro
  BLANK \s+
  EPSILON <e>
  EMPTYSET \{\}
  DIGIT \d
rule
  {BLANK}
  {EPSILON} { [:SYMBOL, nil] }
  {EMPTYSET} { [:SYMBOL, text] }
  {DIGIT} { [:SYMBOL, text.to_i] }
  \||\*|\(|\) { [text, text] }
inner
end
