require 'pry'

puts "Welcome to Mastermind"

puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

instructions = gets.chomp.to_s

if instructions == "p"
  puts "I have generated a beginner sequence with four elements made up of: (r)ed,
        (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
        What's your guess?"
  guess = gets.chomp.to_s
elsif instructions == "i"
  puts "I don't have time to make an instructions file"
else
  puts "Exiting Program"
end

choices = ["r","g","b","y"]


if guess == "c"
  puts "Here is the secret code loser"
  puts random_choices.to_s
elsif  guess.length < 4
  puts "Code is too short - must be four letters"
elsif guess.length > 4
  puts "Code is too long - must be four letter"
elsif guess == "q"
  puts "exiting the game"
else
  puts "Let's play!"
end

guess_array = guess.split("")

difference = choices - guess_array
#binding.pry

results = guess_array.zip(choices).map {|x,y| x==y}

counter = results.count do |word|
  word == true
end


# puts guess.inspect
# puts random_choices.inspect

puts "Guess: #{guess.to_s} has #{4 - difference.count} of the correct elements with #{counter} elements in the correct position(s)
# You've taken 1 guess"










