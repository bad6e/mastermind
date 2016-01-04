require_relative 'router'

class Game

  attr_accessor :key

  def initialize
    @key = key
  end

  def router(guess)
    if options.has_key?(guess)
      options[guess].call
    else
      length_check(guess)
    end
  end

  def options
    {'c' => lambda{secret_code}, 'q' => lambda{exit}}
  end

  def color_choices
    ["r","g","b","y"]
  end

  def key
    secret_code = []
    4.times do
      secret_code << color_choices.sample
    end
    secret_code
  end

  def secret_code
    puts "The secret code is #{@key}"
    restart_message
    router(gets.chomp.to_s)
  end

  def length_check(guess)
    if guess.length > 4 || guess.length < 4
      length_error_message
      router(gets.chomp.to_s)
    else
      play(guess)
    end
  end

  def length_error_message
    puts "The guess must contain exactly 4 colors! - try again idiot"
  end

  def play(guess)
    correct_guess_checker(guess)
  end

  def correct_guess_checker(guess)
    if guess.split("") == @key
      win_message
    else
      incorrect_guess_checker(guess)
    end
  end

  def win_message
    puts "Congratulations you guessed correctly! - Game Over"
  end

  def incorrect_guess_checker(guess)
    position_checker(guess)
    element_checker(guess)
    incorrect_guess_message
  end

  def incorrect_guess_message
    puts "Your guess has INSERT LATER of the correct elements with #{@results} elements in the correct position(s) -- Guess Again!"
    router(gets.chomp.to_s)
  end

  def position_checker(guess)
    results = guess.split("").zip(@key).map {|x,y| x == y}
    @results = results.count {|word| word == true}
  end

  def element_checker(guess)

  end

  def exit
    exit_message
    exit!
  end

  def exit_message
    puts "You have left the game - goodbye!"
  end

  def restart_message
    puts "Let's try this again - please enter a guess"
  end
end