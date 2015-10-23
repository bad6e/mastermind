require_relative 'first_prompt'

class GuessChecker
  def initialize
    @randomizer = randomizer
  end

  def router(guess)

    if guess == "q"
      puts "EXITING THE GAME!"
      exit!
    elsif guess == "c"
      secret_code
    elsif  guess.length < 4
      puts "Code is too short - must be four letters"
      revert
    elsif guess.length > 4
      puts "Code is too long - must be four letter"
      revert
    else
      puts "Let's play!"
      play(guess)
    end
  end

  def secret_code
    puts "The secret code is #{@randomizer}"
  end

  def revert
    FirstPrompt.new.play_game
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

  def play(guess)
    guess_array = guess.split("")

    if guess_array == @final
      puts "Congratulations you guess correctly! - Game Over"
    else
      guess_checker(guess_array)


      puts "Guess:  has NOT DONE of the correct elements with #{counter} elements in the correct position(s)
      # You've taken #{counter} guess(es) - Try Again!"
    end
  end

  def guess_checker(guess_array)
    difference = guess_array - @final
    results = guess_array.zip(@final).map {|x,y| x==y}
    counter = results.count do |word|
      word == true
    end
    counter
  end
end