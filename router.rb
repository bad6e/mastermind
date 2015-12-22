require_relative "game"

class Router

  attr_reader :instructions

  def initialize(instructions)
    router(instructions)
  end

  def router(instructions)
    if options.has_key?(instructions)
      options[instructions].call
    else
      restart_game
    end
  end

  def options
    {'p' => lambda{play_game}, 'q' => lambda{exit_game}, "i" => lambda{show_instructions}}
  end

  def play_game
    play_game_message
    Game.new.router(gets.chomp.to_s)
  end

  def play_game_message
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
  end

  def show_instructions
    show_game_message
    restart_game
  end

  def show_game_message
    puts "The goal of this game is to win"
  end

  def exit_game
    exit_game_message
    exit!
  end

  def exit_game_message
    puts "Leaving the game!"
  end

  def restart_game
    restart_game_message
    router(gets.chomp.to_s)
  end

  def restart_game_message
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end
end