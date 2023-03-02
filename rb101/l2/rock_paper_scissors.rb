VALID_CHOICES = {
  rock: 'rock',
  paper: 'paper',
  scissors: 'scissors'
}.freeze

OUTCOMES = {
  win: 'win',
  lose: 'lose',
  draw: 'draw'
}.freeze

WIN_CONDITIONS = {
  'rock' => VALID_CHOICES[:scissors],
  'paper' => VALID_CHOICES[:rock],
  'scissors' => VALID_CHOICES[:paper]
}.freeze

def prompt(msg)
  puts("=> #{msg}")
end

def valid_choice?(choice)
  VALID_CHOICES.values.include?(choice)
end

def generate_computer_choice
  VALID_CHOICES.values.sample
end

def get_player_choice
  player_choice = nil

  loop do
    prompt("Choose one: #{VALID_CHOICES.values.join(', ')}")
    player_choice = gets.chomp
    break if valid_choice?(player_choice)
    prompt('That is not a valid choice.')
  end

  player_choice
end

def get_outcome(player_choice:, computer_choice:)
  if WIN_CONDITIONS[player_choice] == computer_choice
    OUTCOMES[:win]
  elsif WIN_CONDITIONS[computer_choice] == player_choice
    OUTCOMES[:lose]
  else
    OUTCOMES[:draw]
  end
end

def display_results(outcome)
  if outcome == OUTCOMES[:win]
    prompt('You won!')
  elsif outcome == OUTCOMES[:lose]
    prompt('Computer won!')
  elsif outcome == OUTCOMES[:draw]
    prompt("It's a tie!")
  end
end

def rock_paper_scissors
  player_choice = get_player_choice
  computer_choice = generate_computer_choice
  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")

  outcome = get_outcome(
    player_choice: player_choice,
    computer_choice: computer_choice
  )

  display_results(outcome)
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
