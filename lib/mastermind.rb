require 'pry'
require_relative "router"

class Mastermind

  def initialize
    start_game
  end

  def start_game
    welcome_message
    Router.new(gets.chomp.to_s)
  end

  def welcome_message
    puts "Welcome to Mastermind - Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end
end

Mastermind.new