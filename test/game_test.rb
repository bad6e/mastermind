 #!/usr/bin/env ruby
gem 'minitest'
gem 'mocha'

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/unit'
require 'mocha/mini_test'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @game.key = ["r", "g", "b", "y"]
    @guess = 'rgbr'
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

  def test_it_checks_and_rejects_too_short_of_a_guess
    game = Game.new
    game.stubs(:length_error_message).returns("Error Message too short")

    guess = "abc"
    assert_equal(game.length_check(guess), "Error Message too short")
  end

  def test_it_checks_and_rejects_too_long_of_a_guess
    @game.stubs(:length_error_message).returns("Error Message too long")
    guess = "abcde"
    assert_equal(@game.length_check(guess), "Error Message too long")
  end

  def test_it_wins_the_game_with_the_correct_guess
    skip
    @game.stubs(:win_message).returns("You Won")
    assert_equal(@game.correct_guess_checker("rgby"), "You Won")
  end

  def test_it_does_not_win_the_game_with_an_incorrect_guess
    @game.stubs(:incorrect_guess_checker).returns("Continue On")
    assert_equal(@game.correct_guess_checker("yyyr"), "Continue On")
  end

  def test_it_finds_the_correct_number_elements_in_the_correct_position
    assert_equal(@game.position_checker(@guess), 3)
  end

  def test_it_finds_the_correct_number_of_elements_with_one
    skip
    guess = 'yaaa'
    assert_equal(@game.element_checker(guess), 1)
  end

  def test_it_finds_the_correct_number_of_elements_with_two
    skip
    guess = 'byaa'
    assert_equal(@game.element_checker(guess), 2)
  end

  def test_it_finds_the_correct_number_of_elements_with_three
    skip
    guess = 'gbay'
    assert_equal(@game.element_checker(guess), 3)
  end

  def test_it_finds_the_correct_number_of_elements_with_four
    skip
    game = Game.new
    guess = 'ybgr'
    assert_equal(game.element_checker(guess), 4)
  end
end
