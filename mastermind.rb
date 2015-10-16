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

if guess.length < 4
  puts "Code is too short - must be four letters"
elsif guess.length > 4
  puts "Code is too long - must be four letter"
elsif guess == "q"
  puts "exiting the game"
elsif guess == "c"
  puts "Here is the secret code"
else
  puts "Let's play!"
end





