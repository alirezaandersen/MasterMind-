require_relative 'constants'
require_relative 'settings'
require 'facets'

class GameFlow


  include Constants
  include Settings

  attr_accessor :counter

  def initialize
    @sequence = []
    @counter = 0
    randomizer
  end

  def randomizer
    NUMBER_OF_LETTERS.times {
      @sequence << VALID_LETTERS.shuffle.first
    }
  end

  def play
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    puts "What's your guess?"
    in_game
  end

  def in_game
    loop do
      print ">"
      input = gets.chomp
      game_input(input)
      break if input == @sequence.join
    end
  end

  def game_input(input)
    #validate input
    if input.length > NUMBER_OF_LETTERS
      puts INPUT_TOO_LONG
    elsif input.length < NUMBER_OF_LETTERS
      puts INPUT_TOO_SHORT
    elsif !validate(input)
      puts INVALID_LETTER_USED
    else
      process(input)
    end
    # process input
    # process(input)
  end

  def validate(input)
    input.chars.each do |char|
      return false if !VALID_LETTERS.include?(char)
    end
    return true
  end

  def process(input)
    # convert input to array
    letters = correct_num_of_letters(input)
    positions = correct_positions(input)
    #need to create a quit
    #need a cheat method

    puts "#{input} has #{letters} of the correct elements with #{positions} in the correct positions. You've taken 1 guess"
  end

  def correct_positions(input)
    input_chars = input.chars
    x = input_chars.zip(@sequence).map { |a, b| a == b }
    num_correct_positions = x.count(true)
  end

  # def correct_num_of_letters2(input)
    input_chars = input.chars
    num_correct_letters_hash = @sequence.uniq.map do |char|
      input_chars.frequency.fetch(char,0)
    end
    num_correct_letters = num_correct_letters_hash.reduce(:+)
  end

  def correct_num_of_letters(input)
    num_correct_letters =
    sum = 0
    input.chars.uniq.each{ |char|
      sum += @sequence.count(char)
    }
    sum
  end

  def instructions
    puts INSTRUCTIONS
  end


  def quit
    exit
  end
end
