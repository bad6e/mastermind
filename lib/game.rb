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
    else
      play(guess)
    end
  end

  def length_error_message
    puts "The guess must contain exactly 4 colors! - try again idiot"
    router(gets.chomp.to_s)
  end

  def play(guess)
    correct_guess_checker(guess)
  end

  def correct_guess_checker(guess)
    if guess.split("") == @key
      win_message
    else
      incorrect_guess_message(guess)
    end
  end

  def win_message
    puts "Congratulations you guessed correctly! - Game Over"
  end

  def incorrect_guess_message(guess)
    puts "Your guess has #{element_checker(guess)} of the correct elements with #{position_checker(guess)} elements in the correct position(s) -- Guess Again!"
    router(gets.chomp.to_s)
  end

  def position_checker(guess)
    results = guess.split("").zip(@key).map {|x,y| x == y}
    true_counter(results)
  end

  def element_checker(guess)
    split_guess = guess.split("").uniq
    results = []
    split_guess.each do |r|
      results << @key.include?(r)
    end
    true_counter(results)
  end

  def true_counter(array)
    array.count {|word| word == true}
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