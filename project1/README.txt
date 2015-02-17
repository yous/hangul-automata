LANGUAGE
--------
ruby 1.9.3p125 (2012-02-16 revision 34643) [i686-linux]

HOW TO RUN
----------
디렉토리가 다음과 같이 구성되어 있어야 한다.
PROJECTDIR
  pre_project1.1/pre_project1.1.rb
  pre_project1.2/pre_project1.2.rb
  pre_project2.1/pre_project2.1.rb
  project1/project1.rb

각 프로그램의 실행 방법은 다음과 같다.
ruby (-I[PROJECTDIR]) hangeulComJong.rb
ruby (-I[PROJECTDIR]) hangeulComCho.rb
ruby (-I[PROJECTDIR]) hangeulPhoneJong.rb
ruby (-I[PROJECTDIR]) hangeulPhoneCho.rb

ABOUT
-----
pre_project1.1.rb의 코드가 변경되었다.
MealyMachineSimulator의 run 함수
BEFORE
  (@outputs.include? output) ? eval(output) : break
AFTER
  (@outputs.include? output) ? (output.call state, symbol) : break

getch 함수는 실시간으로 키보드 입력을 받아 문자를 반환한다.

qwertyToHangeul 함수는 영어 문자를 받아 해당 문자의 QWERTY 자판 위치에 해당하는 두벌식 자판의 한글 문자를 반환한다.

elementsToChar 함수는 "first", "middle", "last"를 key로 갖는 Hash buffer를 받아 buffer["first"]를 초성, buffer["middle"]을 중성, buffer["last"]를 종성으로 갖는 한글 문자를 반환한다.

HangeulAutomata는 states, symbols, outputs, stateTransitionFunction, outputFunction, initialState, delTransitionFunction을 입력받는다. delTransitionFunction은 "DEL" 키를 입력받았을 때 실행하는 함수이다. 나머지 인자는 MealyMachineSimulator의 인자와 동일하다.

HangeulAutomata의 run 함수는 전역 변수 $result와 $buffer를 선언하고, getch 함수로 매번 입력을 받아 그 키가 Backspace면 delTransitionFunction을 실행하고 나머지 경우에는 MealyMachineSimulator를 실행한다. 이 때 outputFunction에서는 $result와 $buffer의 값을 변경한다. 그 후 $result와 $buffer에 있는 값을 매번 출력한다. 만약 입력한 키가 Enter나 특수한 키라면 함수는 종료된다.

hangeulCom*.rb에서는 소문자, 대문자 알파벳과 Backspace를 입력 문자로 받는다.
실제 입력은 알파벳으로 하나 이는 프로그램에서 한글로 받아들여질 것이다.
hangeulComJong.rb는 받침우선 컴퓨터 자판 오토마타를 구현한 것이다.
hangeulComCho.rb는 초성우선 컴퓨터 자판 오토마타를 구현한 것이다.

hangeulPhone*.rb에서는 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, *, #, Backspace를 입력 문자로 받는다.
hangeulPhoneJong.rb는 받침우선 3X4 자판 (천지인) 오토마타를 구현한 것이다.
hangeulPhoneCho.rb는 받침우선 3X4 자판 (천지인) 오토마타를 구현한 것이다.
천지인 자판 배열은 다음과 같다.
1 : ㅣ
2 : ·
3 : ㅡ
4 : ㄱㅋㄲ
5 : ㄴㄹ
6 : ㄷㅌㄸ
7 : ㅂㅍㅃ
8 : ㅅㅎㅆ
9 : ㅈㅊㅉ
* : .,?!
0 : ㅇㅁ
# : Space
