OPERATION_VERBS = {
  '1' => 'Adding',
  '2' => 'Subtracting',
  '3' => 'Multiplying',
  '4' => 'Dividing'
}.freeze

def prompt(msg)
  puts("=> #{msg}")
end

def valid_name?(str)
  str = str.to_s
  /^[a-zA-Z\`]++(?:[a-zA-Z\`]++)?$/.match?(str)
end

def valid_number?(num)
  num = num.to_s
  /\A\d+(\.\d+)?\z/.match?(num)
end

def valid_operator?(op)
  OPERATION_VERBS.keys.include?(op)
end

def calculate_again?
  prompt('Do you want to perform another calculation? (y to calculate again)')
  keep_calculating = gets.chomp.downcase

  keep_calculating == 'y' || keep_calculating == 'yes'
end

def operator_prompt
  <<-MSG
What operation would you like to perform?
   1: add
   2: subtract
   3: multiply
   4: divide
  MSG
end

def calculate(op, num1, num2)
  op = OPERATION_VERBS[op]

  case op
  when OPERATION_VERBS['1']
    num1.to_i + num2.to_i
  when OPERATION_VERBS['2']
    num1.to_i - num2.to_i
  when OPERATION_VERBS['3']
    num1.to_i * num2.to_i
  when OPERATION_VERBS['4']
    num1.to_f / num2.to_f
  end
end

def get_name
  name = nil
  loop do
    name = gets.chomp

    break if valid_name?(name)
    prompt('Make sure to use a valid name. Enter a name:')
  end

  name.downcase.capitalize
end

def get_num
  num = nil

  loop do
    num = gets.chomp
    break if valid_number?(num)
    prompt('Invalid input. Please enter a number.')
  end

  num
end

def get_operator
  prompt(operator_prompt)

  operator = nil
  loop do
    operator = gets.chomp

    break if valid_operator?(operator)
    prompt('Invalid input. Please select a valid operator: 1, 2, 3 or 4')
  end

  operator
end

def display_operation_results(op, result)
  operation_verb = OPERATION_VERBS[op]

  prompt("#{operation_verb} the two numbers...")
  prompt("The result is #{result}")
end

def calculator
  prompt("What's the first number?")
  num1 = get_num

  prompt("What's the second number?")
  num2 = get_num

  operator = get_operator

  result = calculate(operator, num1, num2)
  display_operation_results(operator, result)
end

def main
  system('clear')

  prompt('Welcome to Calculator! Enter your name:')

  name = get_name
  prompt("Hi #{name}!")

  loop do
    calculator
    break unless calculate_again?
    system('clear')
  end

  prompt("Thank you for using calculator, #{name}!")
end

# start
main
