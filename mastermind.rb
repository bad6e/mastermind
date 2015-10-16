require 'pry'

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
  end
end

def randomizer
  choices = ["r","g","b","y"]
  shuffle_choices = choices.shuffle
  @final = []

  4.times do
    @final << choices.sample
  end
end

puts "Welcome to Mastermind"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

randomizer

instructions = gets.chomp.to_s

if instructions == "p"
  puts "I have generated a beginner sequence with four elements made up of: (r)ed,
        (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
        What's your guess?"


  guess = gets.chomp.to_s


  guess_checker(guess)

end


guess_array = guess.split("")
difference = guess_array - @final

results = guess_array.zip(@final).map {|x,y| x==y}

counter = results.count do |word|
  word == true
end
guess_counter = 0
guess_counter += 1

puts guess_array.inspect
puts @final.inspect

puts "Guess: #{guess.to_s} has NOT DONE of the correct elements with #{counter} elements in the correct position(s)
# You've taken #{guess_counter} guess"












