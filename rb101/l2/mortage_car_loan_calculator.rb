def prompt(msg)
  puts("=> #{msg}")
end

def prompt_input_invalid
  prompt('Please enter a valid number.')
end

# validate that the input is a number
def valid_number?(input)
  input = input.to_s
  /\A\d+(\.\d+)?\z/.match?(input)
end

# format a number to 2 floating points and return as a string
def formatted_number(number)
  format('%.2f', number)
end

# return a percentage rate in decimals (e.g. 60% becomes 0.6)
def formatted_rate(rate)
  rate = rate.to_f
  rate / 100.0
end

# mortgage loan formula: m = p * (j / (1 - (1 + j) ** (-n)))
def calculate_monthly_payment(amount, rate, duration)
  amount = amount.to_f
  rate = rate.to_f
  duration = duration.to_i

  # if step 1 results in 0, assign 0 as the value for step2
  # to handle the ZeroDivisionError
  step1 = 1 - (1 + rate)**(-duration)
  step2 = step1 == 0.00 ? 0.00 : rate / step1
  amount * step2
end

def get_amount
  loan_amount = nil

  loop do
    prompt('What is your loan amount? (e.g. 10000 for $10,000)')
    loan_amount = gets.chomp
    break if valid_number?(loan_amount)
    prompt_input_invalid
  end

  loan_amount
end

def get_loan_duration_in_months
  loan_duration_in_months = nil

  loop do
    prompt('What is your loan duration (in months)?')
    loan_duration_in_months = gets.chomp
    break if valid_number?(loan_duration_in_months)
    prompt_input_invalid
  end

  loan_duration_in_months
end

def get_monthly_interest_rate
  monthly_interest_rate = nil

  loop do
    prompt('What is your current expected rate (in percentage, e.g. 6 for 6%)?')
    monthly_interest_rate = gets.chomp
    break if valid_number?(monthly_interest_rate)
    prompt_input_invalid
  end

  monthly_interest_rate
end

def loan_calculator
  prompt('Welcome to the Mortgage/Car Loan Calculator!')

  loan_amount = get_amount
  loan_duration_in_months = get_loan_duration_in_months
  monthly_interest_rate = get_monthly_interest_rate

  monthly_payment = calculate_monthly_payment(
    loan_amount,
    monthly_interest_rate,
    loan_duration_in_months
  )

  formatted_monthly_payment = formatted_number(monthly_payment)

  prompt("Your pay back rate is: $#{formatted_monthly_payment}/month")
end

# program start
loop do
  system('clear')

  loan_calculator

  prompt('Do you want to perform another calculation? (y to calculate again)')
  keep_calculating = gets.chomp

  break unless keep_calculating.downcase == 'y'
end

prompt('Thank you for using the Mortgage/Car Loan Calculator!')
