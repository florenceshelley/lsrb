MAX_SCORE = 3

PLAYERS = { player: 'player', computer: 'computer' }.freeze

OUTCOMES = {
  win: 'win',
  lose: 'lose',
  draw: 'draw'
}.freeze

VALID_CHOICES = {
  rock: 'r',
  paper: 'p',
  scissors: 'sc',
  spock: 'sp',
  lizard: 'l'
}.freeze

WINNING_MOVES = {
  VALID_CHOICES[:rock] => [VALID_CHOICES[:scissors], VALID_CHOICES[:lizard]],
  VALID_CHOICES[:paper] => [VALID_CHOICES[:rock], VALID_CHOICES[:spock]],
  VALID_CHOICES[:scissors] => [VALID_CHOICES[:paper], VALID_CHOICES[:lizard]],
  VALID_CHOICES[:spock] => [VALID_CHOICES[:scissors], VALID_CHOICES[:rock]],
  VALID_CHOICES[:lizard] => [VALID_CHOICES[:paper], VALID_CHOICES[:spock]]
}.freeze

def prompt(msg)
  puts("=> #{msg}")
end

def divider
  prompt('-' * 25)
end

def trailing_newline_divider
  divider
  prompt(' ')
end

def play_again?
  prompt('Would you like to play again? (y to keep playing)')
  play_again = gets.chomp.downcase

  play_again == 'y' || play_again == 'yes'
end

# validate that the name consists only of alphabet characters
def valid_name?(str)
  str = str.to_s
  /^[a-zA-Z\`]++(?:[a-zA-Z\`]++)?$/.match?(str)
end

def valid_choice?(player_choice)
  return false if player_choice.empty?

  name, abbr = choice_key_value_pair(player_choice)

  # check if the choice input is the full name or the abbreviation
  name.to_s == player_choice || abbr == player_choice
end

def max_score?(scores)
  scores['player'] >= MAX_SCORE || scores['computer'] >= MAX_SCORE
end

def generate_computer_choice
  VALID_CHOICES.values.sample
end

def interpolated_choices
  choices = []

  VALID_CHOICES.each { |key, value| choices << "#{value} (#{key})" }

  choices
end

# return the abbreviated name of the player's choice
def choice_abbr(choice)
  _, abbr = choice_key_value_pair(choice)
  abbr
end

# return the full name of the player's choice
def choice_name(choice)
  name, = choice_key_value_pair(choice)
  name.to_s
end

# return the full name and abbreviation of the player's choice
def choice_key_value_pair(choice)
  VALID_CHOICES.find do |key, value|
    key.to_s == choice || value == choice
  end
end

def grand_winner(scores)
  scores['player'] < scores['computer'] ? PLAYERS[:computer] : PLAYERS[:player]
end

# capitalize 'computer' name for consistency
def grand_winner_name(winner, player_name)
  winner == PLAYERS[:player] ? player_name : winner.capitalize
end

def increment_scores(outcome, current_scores)
  if outcome == OUTCOMES[:win]
    current_scores['player'] += 1
  elsif outcome == OUTCOMES[:lose]
    current_scores['computer'] += 1
  end
end

def get_player_name
  name = nil
  prompt("What is your name?")

  loop do
    name = gets.chomp
    break if valid_name?(name)
    prompt('Please enter a valid name.')
  end

  # capitalize name for cleanliness and a consistent score format
  name.capitalize
end

def get_player_choice
  player_choice = nil

  loop do
    prompt("Choose one: #{interpolated_choices.join(', ')}")
    player_choice = gets.chomp.downcase
    break if valid_choice?(player_choice)
    prompt('That is not a valid choice.')
  end

  player_choice
end

def get_outcome(player_choice, computer_choice)
  choice = choice_abbr(player_choice)

  if WINNING_MOVES[choice].include?(computer_choice)
    OUTCOMES[:win]
  elsif WINNING_MOVES[computer_choice].include?(choice)
    OUTCOMES[:lose]
  else
    OUTCOMES[:draw]
  end
end

def display_outcome(outcome)
  case outcome
  when OUTCOMES[:win]
    prompt('You won!')
  when OUTCOMES[:lose]
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

def display_scores(scores, player_name)
  prompt("#{player_name}: #{scores['player']}; Computer: #{scores['computer']}")
end

def display_final_results(scores, player_name)
  grand_winner = grand_winner(scores)
  grand_winner_name = grand_winner_name(grand_winner, player_name)
  win_count = scores[grand_winner]
  message = "The grand winner is #{grand_winner_name}, with #{win_count} wins!"

  prompt(message)
end

def display_selections(player_choice, computer_choice)
  player_choice = choice_name(player_choice)
  computer_choice = choice_name(computer_choice)

  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")
end

def rock_paper_scissors_spock_lizard(player_name)
  scores = { PLAYERS[:player] => 0, PLAYERS[:computer] => 0 }

  until max_score?(scores)
    player_choice = get_player_choice
    computer_choice = generate_computer_choice
    display_selections(player_choice, computer_choice)

    outcome = get_outcome(player_choice, computer_choice)
    display_outcome(outcome)
    divider

    increment_scores(outcome, scores)
    display_scores(scores, player_name)
    trailing_newline_divider
  end

  display_final_results(scores, player_name)
end

def main
  system('clear')
  prompt('Welcome to a game of "Rock, Paper, Scissors, Spock, Lizard!"')

  player_name = get_player_name

  loop do
    rock_paper_scissors_spock_lizard(player_name)
    trailing_newline_divider

    break unless play_again?

    # clear the terminal on a new game instead of before every
    # selection so that the player can still see their previous
    # choices, outcomes, and current score
    system('clear')
  end

  prompt("That was fun. Thanks for playing, #{player_name}!")
end

# start
main
