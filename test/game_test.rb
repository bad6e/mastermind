 #!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @game.key = ["y", "y", "y", "y"]
    @guess = 'yyyr'
  end

  def test_it_finds_the_correct_number_elements_in_the_correct_position
    assert_equal(@game.position_checker(@guess), 3)
  end

  def test_it_has_four_color_choices
    colors = @game.color_choices
    assert_equal(colors.length, 4)
  end

  def test_it_creates_a_random_key
    keys = []
    50.times do
      keys << Game.new.key
    end
    assert(keys.uniq.size > 30)
  end
end
