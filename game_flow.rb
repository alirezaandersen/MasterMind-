require_relative 'constants'
require_relative 'settings'
require 'facets'

class GameFlow


  include Constants
  include Settings

  def initialize
    @sequence = []
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
    print ">"
    input = gets.chomp
    game_input(input)
  end

  def game_input(input)
    #validate input
    if input.length > NUMBER_OF_LETTERS
      puts INPUT_TOO_LONG
    elsif input.length < NUMBER_OF_LETTERS
      puts INPUT_TOO_SHORT
    else
      puts "good guess."
    end
    #process input
    process(input)
  end

  def process(input)
    #convert input to array
    input_chars = input.chars
    #compare input to sequence

    x = input_chars.zip(@sequence).map { |a, b| a == b }
    num_correct_positions = x.count(true)

    num_correct_letters_hash = @sequence.uniq.map do |char|
      input_chars.frequency.fetch(char,0)
    end
    num_correct_letters = num_correct_letters_hash.reduce(:+)

    #print something to the string
    require 'pry' ; binding.pry
  end

  def instructions
    puts INSTRUCTIONS
  end


  def quit
    exit
  end
end
