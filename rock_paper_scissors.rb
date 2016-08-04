
VALID_CHOICES = %w(rock paper scissors lizard spock)

lettering = { 'r' => "rock", 'p' => "paper", 'sc' => "scissors",
              'l' => "lizard", 'sp' => "spock" }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def rock_win?(first, second)
  (first == "rock" && second == "lizard") ||
    (first == "rock" && second == "scissors")
end

def paper_win?(first, second)
  (first == "paper" && second == "spock") ||
    (first == "paper" && second == "rock")
end

def scissors_win?(first, second)
  (first == "scissors" && second == "lizard") ||
    (first == "scissors" && second == "paper")
end

def spock_win?(first, second)
  (first == "spock" && second == "rock") ||
    (first == "spock" && second == "scissors")
end

def lizard_win?(first, second)
  (first == "lizard" && second == "paper") ||
    (first == "lizard" && second == "spock")
end

prompt("Welcome to #{VALID_CHOICES.join(', ')}.")
prompt("First to 5 points wins")

player_score = 0
computer_score = 0
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
    prompt("r (ROCK), P (Paper), sc (Scissors), l (lizard), or sp (Spock).")
    choice = Kernel.gets().chomp().downcase()
    choice = lettering[choice]

    if lettering.values.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = lettering.values.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  if rock_win?(choice, computer_choice)
    prompt("You won!")
    player_score += 1
  elsif rock_win?(computer_choice, choice)
    prompt("Computer won!")
    computer_score += 1
  elsif paper_win?(choice, computer_choice)
    prompt("You won!")
    player_score += 1
  elsif paper_win?(computer_choice, choice)
    prompt("Computer won!")
    computer_score += 1
  elsif scissors_win?(choice, computer_choice)
    prompt("You won!")
    player_score += 1
  elsif scissors_win?(computer_choice, choice)
    prompt("Computer won!")
    computer_score += 1
  elsif spock_win?(choice, computer_choice)
    prompt("You won!")
    player_score += 1
  elsif spock_win?(computer_choice, choice)
    prompt("Computer won!")
    computer_score += 1
  elsif lizard_win?(choice, computer_choice)
    prompt("You won!")
    player_score += 1
  elsif lizard_win?(computer_choice, choice)
    prompt("Computer won!")
    computer_score += 1
  else
    prompt("It's a tie!")
  end

  prompt("Player: #{player_score}, Computer: #{computer_score}")
  if player_score >= 5 || computer_score >= 5
    break
  else
    prompt("Do you want to play again?")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
  end
end

prompt("Thank you for playing! Goodbye.")
