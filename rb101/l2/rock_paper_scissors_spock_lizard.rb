VALID_CHOICES = {
  rock: 'r',
  paper: 'p',
  scissors: 'sc',
  spock: 'sp',
  lizard: 'l'
}.freeze

OUTCOMES = {
  win: 'win',
  lose: 'lose',
  draw: 'draw'
}.freeze

WINNING_CHOICES = {
  VALID_CHOICES[:rock] => [VALID_CHOICES[:scissors], VALID_CHOICES[:lizard]],
  VALID_CHOICES[:paper] => [VALID_CHOICES[:rock], VALID_CHOICES[:spock]],
  VALID_CHOICES[:scissors] => [VALID_CHOICES[:paper], VALID_CHOICES[:lizard]],
  VALID_CHOICES[:spock] => [VALID_CHOICES[:scissors], VALID_CHOICES[:rock]],
  VALID_CHOICES[:lizard] => [VALID_CHOICES[:paper], VALID_CHOICES[:spock]]
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

def interpolated_choices
  choices = []
  VALID_CHOICES.each { |key, value| choices << "#{value} (#{key})" }

  choices
end

def choice_name(choice)
  choice = VALID_CHOICES.find { |_, value| value == choice }
  choice[0].to_s
end

def get_player_choice
  player_choice = nil

  loop do
    prompt("Choose one: #{interpolated_choices.join(', ')}")
    player_choice = gets.chomp
    break if valid_choice?(player_choice)
    prompt('That is not a valid choice.')
  end

  player_choice
end

def get_outcome(player_choice, computer_choice)
  if WINNING_CHOICES[player_choice].include?(computer_choice)
    OUTCOMES[:win]
  elsif WINNING_CHOICES[computer_choice].include?(player_choice)
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

def display_selections(player_choice, computer_choice)
  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")
end

def rock_paper_scissors_spock_lizard
  player_choice = get_player_choice
  computer_choice = generate_computer_choice

  player_choice_name = choice_name(player_choice)
  computer_choice_name = choice_name(computer_choice)
  display_selections(player_choice_name, computer_choice_name)

  outcome = get_outcome(player_choice, computer_choice)
  display_results(outcome)
end

# program start
prompt('Welcome to a game of "Rock, Paper, Scissors, Spock, Lizard!"')

loop do
  system('clear')

  rock_paper_scissors_spock_lizard

  prompt('Would you like to play again? (y to keep playing)')
  play_again = gets.chomp.downcase

  break unless play_again == 'y' || play_again == 'yes'
end

prompt('That was fun, thanks for playing!')
