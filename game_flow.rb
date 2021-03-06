require 'json'
require 'colorize'
require_relative 'instruction'
require_relative 'settings'

class GameFlow





  attr_accessor :counter, :settings, :instruct

  def initialize
    @settings = Settings.new
    @instruct = Instruction.new
    @sequence = []
    @counter = 0
    @start_time
    @end_time
    @high_score = Hash.new{|h,k| h[k] =[]}
  end

  def randomizer
    @settings.difficulty_levels
    @settings.number_of_letters.times {
      @sequence << @settings.valid_colors.shuffle.first
    }
    # binding.pry
  end

  def play
    @start_time = Time.now
    puts "What's your guess?"
    in_game
  end

  def in_game
    loop do
      print ">"
      input = gets.chomp.downcase
      game_input(input)
      break if input == @sequence.join
    end
  end

  def game_input(input)
    case input
    when 'q', 'quit'
      quit
    when 'c', 'cheat'
      cheat
    else
      if valid?(input)
        @counter += 1
        process(input)
      end
    end
  end

  def valid?(input)
    if input.length > @settings.number_of_letters
      puts Instruction::INPUT_TOO_LONG
      return false
    elsif input.length < @settings.number_of_letters
      puts Instruction::INPUT_TOO_SHORT
      return false
    elsif !valid_letters?(input)
      puts Instruction::INVALID_LETTER_USED
      return false
    end
    true
  end

  def valid_letters?(input)
    input.chars.each do |char|
      return false if !@settings.valid_colors.include?(char)
    end
    return true
  end

  def process(input)
    letters = correct_num_of_letters(input)
    positions = correct_positions(input)
    result = "#{@counter} " + (@counter > 1 ? "guesses" : "guess")

    if letters == positions && @settings.number_of_letters == positions
      @end_time = Time.now
      puts "Congratulations! You guessed the sequence '#{input.upcase}' in  #{result} over #{time_diff(@start_time, @end_time)}"

      process_winner

    else
      puts "#{input} has #{letters} of the correct elements with #{positions} in the correct positions. You've taken #{result}"
    end
  end

  def process_winner
    # congratulations
    puts "Do you want to (p)lay again or (q)uit?"
    print ">"
    input = gets.chomp
    case input
    when 'p', 'play'
      reset
      play
    when 'q', 'quit'
      puts "Thank you for playing!"
      quit
    end
  end

  def congratulations
    puts "Congratulations! You've guessed the sequence! What's your name?"
    input_name = gets.chomp
    score_keeper(input_name)
    # list_scores
  end

  def score_keeper(input_name)
    @high_score[input_name] << [@counter,time_diff(@start_time, @end_time)]
  end

  def score_list
    val = @high_score.map do |k,v|
      [k,v.min_by do |a| a[0]
      end]
    end
  end

  def list_scores
    x = score_list.sort_by do |a|
      a[1][0]
    end
    puts "#{x}"
  end


  # def top_ten
  #   print ">" "#{name}
  #
  #   #{name}, you guessed the sequence '#{input.upcase}' in #{@counter} guesses over #{time_diff(@start_time, @end_time)}. That's 1 minute, 10 seconds faster and #{number_of_guesses} guesses fewer than the average."
  # end

  def correct_positions(input)
    input_chars = input.chars
    x = input_chars.zip(@sequence).map {
      |a, b| a == b
    }
    num_correct_positions = x.count(true)
  end

  def correct_num_of_letters(input)
    sequence_dup = @sequence.dup

    sum = 0
    matching_letters = []
    input.chars.each { |char|
      index = sequence_dup.index(char)
      if !index.nil?
        sum += 1
        sequence_dup.delete_at(index)
      end
    }
    sum
  end

  def instructions
    puts Instruction::INSTRUCTIONS
  end

  def quit
    exit
  end

  def cheat
    puts @sequence.join
  end

  def reset
    @sequence = []
    @counter = 0
    randomizer
  end

  def time_diff(start_time, end_time)
    seconds_diff = (start_time - end_time).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff
    "#{hours.to_s} hours, #{minutes.to_s} minutes and #{seconds.to_s} seconds"
  end

end
