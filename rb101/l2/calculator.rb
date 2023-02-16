# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

Kernel.puts('Welcome to Calculator!')

Kernel.puts("What's the first number?")
num1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
num2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform?\n1: add 2: subtract 3: multiply 4: divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator == '2'
  result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
elsif operator == '4'
  result = num1.to_f / num2.to_f
end

Kernel.puts("The result is #{result}")
