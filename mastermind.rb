require 'pry'
require_relative "first_prompt"

class Mastermind

  def play
    FirstPrompt.new.welcome_message
  end
end

Mastermind.new.play