# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

def prompt(msg)
  Kernel.puts("=> #{msg}")
end

def valid_name?(str)
  str = str.to_s
  /^\w/.match(str)
end

def valid_number?(num)
  num = num.to_s
  /^\d/.match(num)
end

def valid_operator?(op)
  %w(1 2 3 4).include?(op)
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

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

def calculate(op, num1, num2)
  case op
  when '1'
    num1.to_i + num2.to_i
  when '2'
    num1.to_i - num2.to_i
  when '3'
    num1.to_i * num2.to_i
  when '4'
    num1.to_f / num2.to_f
  end
end

def get_name
  name = nil
  loop do
    name = Kernel.gets.chomp

    break if valid_name?(name)
    prompt('Make sure to use a valid name. Enter a name:')
  end

  name
end

def get_num1
  num1 = nil
  loop do
    prompt("What's the first number?")
    num1 = Kernel.gets.chomp

    break if valid_number?(num1)
    prompt('Invalid input. Please enter a number.')
  end

  num1
end

def get_num2
  num2 = nil
  loop do
    prompt("What's the second number?")
    num2 = Kernel.gets.chomp

    break if valid_number?(num2)
    prompt('Invalid input. Please enter a number.')
  end

  num2
end

def get_operator
  prompt(operator_prompt)

  operator = nil
  loop do
    operator = Kernel.gets.chomp

    break if valid_operator?(operator)
    prompt('Invalid input. Please select a valid operator: 1, 2, 3 or 4')
  end

  operator
end

prompt('Welcome to Calculator! Enter your name:')

name = get_name
prompt("Hi #{name}!")

loop do
  num1 = get_num1
  num2 = get_num2
  operator = get_operator

  result = calculate(operator, num1, num2)

  operation_message = operation_to_message(operator)
  prompt("#{operation_message} the two numbers...")
  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (y to calculate again)")
  keep_calculating = Kernel.gets.chomp

  break unless keep_calculating.downcase == 'y'
end

prompt("Thank you for using calculator, #{name}!")
