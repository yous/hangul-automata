require 'pre_project2.1/pre_project2.1'
require 'project2/regex.tab'

def parseAST(ast, final_flag = false)
  if ast.instance_of? String and ast == "{}"
    $states.push "q#{$states.length}"
  elsif ast.nil? or (ast.instance_of? Fixnum and ast >= 0 and ast <= 9)
    $symbols.add ast if ast.instance_of? Fixnum
    $states.push "q#{$states.length}"
    $stateTransition[$states[-2]] ||= Hash.new
    $stateTransition[$states[-2]][ast] = $states[-1]
  elsif ast.instance_of? Hash
    case ast.keys[0]
    when "|"
      r_len = $states.length
      $states.push "q#{r_len}"
      $stateTransition[$states[-2]] ||= Hash.new
      $stateTransition[$states[-2]][nil] = Set.new([$states[-1]])
      parseAST(ast.values[0][0])

      s_len = $states.length
      $states.push "q#{s_len}"
      $stateTransition[$states[r_len - 1]][nil].add $states[-1]
      parseAST(ast.values[0][1])

      $states.push "q#{$states.length}"
      $stateTransition[$states[s_len - 1]] ||= Hash.new
      $stateTransition[$states[s_len - 1]][nil] = $states[-1]
      $stateTransition[$states[-2]] ||= Hash.new
      $stateTransition[$states[-2]][nil] = $states[-1]
    when "."
      parseAST(ast.values[0][0])
      $states.push "q#{$states.length}"
      $stateTransition[$states[-2]] ||= Hash.new
      $stateTransition[$states[-2]][nil] = $states[-1]

      parseAST(ast.values[0][1])
    when "*"
      r_len = $states.length
      $states.push "q#{r_len}"
      $stateTransition[$states[-2]] ||= Hash.new
      $stateTransition[$states[-2]][nil] = Set.new([$states[-1]])
      parseAST(ast.values[0])

      $states.push "q#{$states.length}"
      $stateTransition[$states[-2]] ||= Hash.new
      $stateTransition[$states[-2]][nil] = Set.new(["q#{r_len}", $states[-1]])
      $stateTransition[$states[r_len - 1]][nil].add $states[-1]
    end
  end
  $finalStates.push $states[-1] if final_flag
end

regex = RegularExpression.new
while true
  print ">> "
  str = STDIN.gets.strip
  break if /exit/i === str
  begin
    ast = regex.scan_str(str)
    $states = ["q0"]
    $symbols = Set.new
    $stateTransition = Hash.new
    initialState = $states[0]
    $finalStates = []
    parseAST(ast, true)

    mDFA = eNFA_to_mDFA($states, $symbols.entries, StateTransitionFunction.new($stateTransition), initialState, $finalStates)
    puts "state = #{mDFA[0]}"
    puts "final_state = #{mDFA[4]}"
    mDFA[0].each do |state|
      mDFA[1].each do |symbol|
        puts "(#{state}, #{mDFA[2].transition(state, symbol)}, #{symbol})"
      end
    end
   rescue Exception => e
     puts "#{e.backtrace[0]}: #{e.message} (#{e.class})"
     e.backtrace.drop(1).each do |msg|
       puts "\tfrom #{msg}"
     end
  end
end
