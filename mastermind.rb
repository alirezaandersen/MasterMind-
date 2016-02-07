require 'colorize'
require_relative 'game_flow'
require_relative 'constants'

class MasterMind



  attr_accessor :game

  def initialize
    @game = GameFlow.new
  end

  def display_intro
    puts "Welcome to MASTERMIND"
    puts
  end

  def difficulty_levels
  display_intro
    puts "What level would you like to play at?"
    print "(B)eginning level with 4 characters".colorize(:blue)
    print "(I)ntermidate level with 6 characters and 5 colors".colorize(:purple)
    print "(A)dvance level with 8 characters and 6 colors".colorize(:red)
  input = gets.chomp
  goes to selection module? then goes to play mode.
  end

  def start
    display_intro
    loop do
      puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
      print ">"
      input = gets.chomp
      process_input(input)
    end
  end

  def process_input(input)
    case input.downcase
    when 'p', 'play'
      game.play
    when 'i', 'instructions'
      game.instructions
    when 'q', 'quit'
      game.quit
    else
      puts input + " is undefined"
    end
  end
end


m = MasterMind.new
m.start
