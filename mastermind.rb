require 'pry'
require_relative "first_prompt"

class Mastermind

  def initialize
    @randomizer = randomizer
  end

  def play
    FirstPrompt.new.welcome_message

    # FirstPrompt.new(instructions).router
  end



  def randomizer
    choices = ["r","g","b","y"]
    shuffle_choices = choices.shuffle
    @final = []

    4.times do
      @final << choices.sample
    end
    @final
  end

  def counter
    guess = 1
    @guess_counter = guess + 1
  end

  def game_play
    guess_array = @guess.split("")

    if guess_array == @final
      puts "Congratulations you guess correctly! - Game Over"
    else
      difference = guess_array - @final

      results = guess_array.zip(@final).map {|x,y| x==y}

      counter = results.count do |word|
        word == true
      end

      counter

      puts guess_array.inspect
      puts @final.inspect

      puts "Guess:  has NOT DONE of the correct elements with #{counter} elements in the correct position(s)
      # You've taken #{counter} guess(es) - Try Again!"
      play
    end
  end
end

Mastermind.new.play