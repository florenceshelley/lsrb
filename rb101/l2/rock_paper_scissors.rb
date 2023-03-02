VALID_CHOICES = %w[
  rock
  paper
  scissors
].freeze

def prompt(msg)
  puts("=> #{msg}")
end

def choices_array_to_hash
  VALID_CHOICES.each_with_object({}) do |choice, hash|
    symbol = choice.to_sym
    hash[symbol] = choice
  end
end

WIN_CONDITIONS = {
  'rock' => choices_array_to_hash[:scissors],
  'paper' => choices_array_to_hash[:rock],
  'scissors' => choices_array_to_hash[:paper]
}.freeze

def valid_choice?(choice)
  choices_array_to_hash.values.include?(choice)
end

def generate_computer_choice
  choices_array_to_hash.values.sample
end

def get_player_choice
  player_choice = nil

  loop do
    prompt("Choose one: #{choices_array_to_hash.values.join(', ')}")
    player_choice = gets.chomp
    break if valid_choice?(player_choice)
    prompt('That is not a valid choice.')
  end

  player_choice
end

def display_results(player_choice, computer_choice)
  if player_choice == choices_array_to_hash[:rock] && computer_choice == choices_array_to_hash[:scissors] ||
    player_choice == choices_array_to_hash[:paper] && computer_choice == choices_array_to_hash[:rock] ||
    player_choice == choices_array_to_hash[:scissors] && computer_choice == choices_array_to_hash[:paper]
    prompt('You won!')
  elsif player_choice == choices_array_to_hash[:rock] && computer_choice == choices_array_to_hash[:paper] ||
    player_choice == choices_array_to_hash[:paper] && computer_choice == choices_array_to_hash[:scissors] ||
    player_choice == choices_array_to_hash[:scissors] && computer_choice == choices_array_to_hash[:rock]
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

def rock_paper_scissors
  player_choice = get_player_choice
  computer_choice = generate_computer_choice
  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")

  display_results(player_choice, computer_choice)
end

# program start
prompt('Welcome to a game of "Rock, paper, scissors!"')

loop do
  rock_paper_scissors

  prompt('Would you like to play again? (y to keep playing)')
  play_again = gets.chomp.downcase

  break unless play_again == 'y'
end

prompt('That was fun! Thanks for playing "Rock, paper, scissors!"')
