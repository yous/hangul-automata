# Final Project

## Language

ruby 1.9.3p327 (2012-11-10 revision 37606) [i686-linux]

## How to run

디렉토리가 다음과 같이 구성되어 있어야 한다.
```
PROJECTDIR
  pre_project1.1/pre_project1.1.rb
  pre_project1.2/pre_project1.2.rb
  pre_project2.1/pre_project2.1.rb
  project1/project1.rb
  project2/project2.rb
  final_project/comRegex.racc
                comRegex.rex
                comRegex.rex.rb
                comRegex.tab.rb
                final_project.rb
                hangeulComCho.rb
                hangeulComJong.rb
                hangeulCom.rb
                hangeulPhoneCho.rb
                hangeulPhoneJong.rb
                hangeulPhone.rb
                phoneRegex.racc
                phoneRegex.rex
                phoneRegex.rex.rb
                phoneRegex.tab.rb
```

다음 ruby gem들이 설치되어 있어야 한다.
```
rexical (1.0.5)
racc (1.4.9)
```

프로그램의 제작 과정은 다음과 같다.
```
rex comRegex.rex # comRegex.rex.rb 생성
racc comRegex.racc # comRegex.tab.rb 생성
ruby (-I[PROJECTDIR]) hangeulCom.rb > hangeulComJong.rb # mDFA를 나타내는 코드 생성
ruby (-I[PROJECTDIR]) hangeulCom.rb > hangeulComCho.rb # mDFA를 나타내는 코드 생성
hangeulComJong.rb, hangeulComCho.rb 작성

rex phoneRegex.rex # phoneRegex.rex.rb 생성
racc phoneRegex.racc # phoneRegex.tab.rb 생성
ruby (-I[PROJECTDIR]) hangeulPhone.rb > hangeulPhoneJong.rb # mDFA를 나타내는 코드 생성
ruby (-I[PROJECTDIR]) hangeulPhone.rb > hangeulPhoneCho.rb # mDFA를 나타내는 코드 생성
hangeulPhoneJong.rb, hangeulPhoneCho.rb 작성
```

프로그램의 실행 방법은 다음과 같다.
```
ruby (-I[PROJECTDIR]) hangeulComJong.rb
ruby (-I[PROJECTDIR]) hangeulComCho.rb
ruby (-I[PROJECTDIR]) hangeulPhoneJong.rb
ruby (-I[PROJECTDIR]) hangeulPhoneCho.rb
```

hangeulComJong.rb, hangeulComCho.rb는 `[a-zA-Z]*`를 입력받는다.
hangeulPhoneJong.rb, hangeulPhoneCho.rb는 `[0-9\.\#]*`를 입력받는다.
각 프로그램은 한 글자 입력받을 때마다 만들어진 문장을 한 줄에 출력한다.
한글이 만들어지지 않는 입력을 할 경우 문장이 변경되지 않고, 이 때 이미 입력된 문장을 조금 지우면 다시 입력이 가능하다.

## About

rexical과 racc은 각각 ruby를 위한 lex, yacc 라이브러리다. 각각을 설치하면 rex 명령을 이용해 .rex 파일로부터 해당 .rex.rb 코드를 생성하고, racc 명령을 이용해 .racc 파일로부터 해당 .tab.rb 코드를 생성한다.
.rex, .racc 파일에 유니코드가 있는 경우 .rex.rb, .tab.rb의 인코딩을 파일 맨 위에 선언해 주어야 한다. (Ex: # encoding: utf-8)

comRegex.rex, comRegex.racc은 hangeulComJong.rb, hangeulComCho.rb를 위한 rex, racc 파일이고, phoneRegex.rex, phoneRegex.racc은 hangeulPhoneJong.rb, hangeulPhoneCho.rb를 위한 rex, racc 파일이다.

hangeulCom.rb는 hangeulComJong.rb와 hangeulComCho.rb 작성에 필요한 mDFA를 정규식으로부터 생성하고, 이를 출력한다.
hangeulPhone.rb는 hangeulPhoneJong.rb와 hangeulPhoneCho.rb 작성에 필요한 mDFA를 정규식으로부터 생성하고, 이를 출력한다.
정규식은 `((초성)(중성)|(초성)(중성)(종성))*`의 구조를 가졌고, hangeulPhone.rb에서는 기호와 공백도 받아들이도록 변경되었다.

hangeulComJong.rb, hangeulComCho.rb, hangeulPhoneJong.rb, hangeulPhoneCho.rb는 프로젝트 1에서 동일한 이름을 갖는 파일과 동일한 구조를 가졌다. 프로젝트 1의 `HangeulAutomata` 클래스 인스턴스를 생성한 후 메소드 `run`을 실행한다.

프로젝트 1의 프로그램에 비해 본 프로젝트의 프로그램은 다음과 같은 특징을 갖는다.
1. Dead state에 해당하는 입력을 받았을 때 종료되지 않고 문장은 그대로 유지된다. 이 때 입력된 문장을 지우면 다시 추가로 입력할 수 있다.
2. 초성만으로 된 입력은 받아들이지 않는다.
3. 프로젝트 1에서 일부 의도와 다르게 구현된 코드 오류들이 수정되었다.

위 항목들을 제외한 나머지 부분은 프로젝트 1의 프로그램과 동일하다. 3번에서 제시된 오류를 제외하면 동일한 DFA로 작동하고 있음을 알 수 있었다.
