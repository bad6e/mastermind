require_relative 'first_prompt'

class GuessChecker
  def initialize
    @randomizer = randomizer
    @counter = 0
  end

  def router(guess)
    if guess == "q"
      puts "EXITING THE GAME!"
      exit!
    elsif guess == "c"
      secret_code
      revert
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
     puts "I have generated a beginner sequence with four elements made up of: (r)ed,
          (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
          What's your guess?"
      guess = gets.chomp.to_s
      router(guess)
  end

  def choices
    ["r","g","b","y"]
  end

  def randomizer
    shuffle_choices = choices.shuffle
    @final = []
    4.times do
      @final << choices.sample
    end
    @final
  end

  def elements(guess)
    n = 0
    elements = []
    guess.each do |l|
      elements << l.include?(choices[n])
      n+1
    end

    @element_results = elements.count do |word|
      word == true
    end
    @element_results
  end

  def play(guess)
    guess_array = guess.split("")
    if guess_array == @final
      puts "Congratulations you guessed correctly! - Game Over"
    else
      @counter += 1
      guess_checker(guess_array)
      elements(guess_array)
      puts "Your guess has #{@element_results} of the correct elements with #{@result} elements in the correct position(s)
      # You've taken #{@counter} guess(es) - Try Again!"
      revert
    end
  end

  def guess_checker(guess_array)
    results = guess_array.zip(@final).map {|x,y| x == y}
    @result = results.count do |word|
      word == true
    end
    @result
  end
end