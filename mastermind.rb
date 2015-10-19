require 'pry'

class Mastermind

  def initialize
    @randomizer = randomizer
  end

  def play
    puts "Welcome to Mastermind"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    instructions = gets.chomp.to_s
    starter(instructions)
  end

  def starter(instructions)
    if instructions == "p"
      puts "I have generated a beginner sequence with four elements made up of: (r)ed,
          (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
          What's your guess?"
      @guess = gets.chomp.to_s
      guess_checker(@guess)
    elsif instructions == "i"
      puts "The goal of this game is to win"
    elsif instructions == "q"
      puts "Leaving game!"
      exit!
    end
  end

  def guess_checker(guess)
    if guess == "c"
      puts "Here is the secret code loser #{@final}"
      exit!
    elsif  guess.length < 4
      puts "Code is too short - must be four letters"
    elsif guess.length > 4
      puts "Code is too long - must be four letter"
    elsif guess == "q"
      puts "exiting the game"
    else
      puts "Let's play!"
      game_play
    end
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

  def game_play
    guess_array = @guess.split("")

    if guess_array == @final
      puts "Done"
    else
      difference = guess_array - @final

      results = guess_array.zip(@final).map {|x,y| x==y}

      counter = results.count do |word|
        word == true
      end
      guess = 0
      guess_counter = guess + 1

      puts guess_array.inspect
      puts @final.inspect

      puts "Guess: #{guess.to_s} has NOT DONE of the correct elements with #{counter} elements in the correct position(s)
      # You've taken #{guess_counter} guess - Try Again!"
      play
    end
  end
end

Mastermind.new.play