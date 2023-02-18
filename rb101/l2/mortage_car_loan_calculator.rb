def prompt(msg)
  puts("=> #{msg}")
end

def prompt_input_invalid
  prompt('Please enter a valid number.')
end

# validate that the input is a number
def validate_number(input)
  input = input.to_s
  /^\d/.match(input)
end

# format a number to 2 floating points
def formatted_number(number)
  format('%.2f', number).to_f
end

# return a percentage rate in decimals (e.g. 60% becomes 0.6)
def formatted_rate(rate)
  rate = rate.to_f
  rate / 100.0
end

# mortgage loan formula: m = p * (j / (1 - (1 + j) ** (-n)))
def calculate_monthly_payment(amount, rate, duration)
  amount = formatted_number(amount)
  rate = formatted_rate(rate)
  duration = duration.to_i

  step1 = 1 - (1 + rate)**(-duration)
  step2 = rate / formatted_number(step1)
  total = amount * formatted_number(step2)
  formatted_number(total)
end

def get_amount
  loan_amount = nil

  loop do
    prompt('What is your loan amount?')
    loan_amount = gets.chomp
    break unless validate_number(loan_amount).nil?
    prompt_input_invalid
  end

  loan_amount
end

def get_loan_duration_in_months
  loan_duration_in_months = nil

  loop do
    prompt('What is your loan duration (in months)?')
    loan_duration_in_months = gets.chomp
    break unless validate_number(loan_duration_in_months).nil?
    prompt_input_invalid
  end

  loan_duration_in_months
end

def get_monthly_interest_rate
  monthly_interest_rate = nil

  loop do
    prompt('What is your current expected rate (in percentage, e.g. 6 for 6%)?')
    monthly_interest_rate = gets.chomp
    break unless validate_number(monthly_interest_rate).nil?
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

  prompt("Your pay back rate is: #{monthly_payment}/month")
end

# program start
loop do
  loan_calculator

  prompt('Do you want to perform another calculation? (y to calculate again)')
  keep_calculating = gets.chomp

  break unless keep_calculating.downcase == 'y'
end

prompt('Thank you for using the Mortgage/Car Loan Calculator!')
