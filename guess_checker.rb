class GuessChecker
  def self.guess(guess)
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
    end
  end
end