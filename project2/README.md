# Project 2

## Language

ruby 1.9.3p125 (2012-02-16 revision 34643) [i686-linux]

## How to run

디렉토리가 다음과 같이 구성되어 있어야 한다.
```
PROJECTDIR
  pre_project1.1/pre_project1.1.rb
  pre_project1.2/pre_project1.2.rb
  pre_project2.1/pre_project2.1.rb
  project2/regex.rex
           regex.racc
           project2.rb
```

다음 ruby gem들이 설치되어 있어야 한다.
```
rexical (1.0.5)
racc (1.4.9)
```

프로그램의 실행 방법은 다음과 같다.
``` sh
rex regex.rex # regex.rex.rb 생성
racc regex.racc # regex.tab.rb 생성
ruby (-I[PROJECTDIR]) project2.rb
```

## About
rexical과 racc은 각각 ruby를 위한 lex, yacc 라이브러리다. 각각을 설치하면 rex 명령을 이용해 .rex 파일로부터 해당 .rb 코드를 생성하고, racc 명령을 이용해 .racc 파일로부터 해당 .rb 코드를 생성한다.

lex 코드는 regex.rex에 구현되어 있고, yacc 코드는 regex.racc에 구현되어 있다.
regex.rex에서는 `BLANK`, `EPSILON`, `EMPTYSET`, `DIGIT`을 ruby의 regular expression을 이용해 나타내고, 각각을 yacc으로 어떻게 넘겨줄지 명시되어 있다.

`{BLANK} => BLANK`일 때 아무 일도 하지 않는다.
`{EPSILON} { [:SYMBOL, nil] } => EPSILON`일 때 nil을 넘겨주고, yacc에서는 이를 SYMBOL로 인식한다.
`{EMPTYSET} { [:SYMBOL, text] } => EMPTYSET`일 때 해당 text를 그대로 넘겨주고, yacc에서는 이를 SYMBOL로 인식한다.
`{DIGIT} { [:SYMBOL, text.to_i] } => DIGIT`일 때 해당 text를 숫자로 변환해 넘겨주고, yacc에서는 이를 SYMBOL로 인식한다.
`\||\*|\(|\) { [text, text] } => |, *, (, )`일 때 해당 text를 그대로 넘겨주고, yacc에서는 이를 그대로 인식한다.

racc에서는 입력받은 문자열을 어떻게 파싱할 지 명시되어 있다. 전체 문자열은 `target`으로 들어가고, `target`에서부터 파싱을 시작한다. 각 rule 옆의 `{}`는 해당 문법에서 어떤 형식을 반환할 것인지 나타낸다.

project2.rb의 `parseAST` 함수는 `AST`와 `final_flag`를 받아 `stateTransition`으로 변환해주는 함수다.

project2.rb를 실행하면 `str`에 사용자 입력을 받아 `regex.scan_str(str)`을 이용해 AST를 받고, 이를 `parseAST`를 이용해 eNFA를 얻은 다음, `eNFA_to_mDFA`를 이용해 mDFA를 얻어 출력하는 과정을 반복한다.
