require_relative "guess_checker"

class FirstPrompt

  attr_reader :instructions

  def initialize
    @instructions = instructions
  end

  def router(instructions)
    if instructions == "p"
      play_game
    elsif instructions == "i"
      show_instructions
    elsif instructions == "q"
      exit_game
    else
      welcome_message
    end
  end

  def welcome_message
    puts "Welcome to Mastermind"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    instructions = gets.chomp.to_s
    router(instructions)
  end

  def play_game
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
          (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
          What's your guess?"
    guess = gets.chomp.to_s
    GuessChecker.guess(guess)
  end

  def show_instructions
    puts "The goal of this game is to win"
    welcome_message
  end

  def exit_game
    puts "Leaving the game!"
    exit!
  end
end