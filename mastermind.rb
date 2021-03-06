require 'colorize'
require_relative 'game_flow'
require_relative 'instruction'
require_relative 'settings'

class MasterMind

  attr_accessor :game, :settings

  def initialize
    @game = GameFlow.new
    @settings = Settings.new
  end

  def display_intro
    puts "Welcome to MASTERMIND"
    puts
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
      #settings.difficulty_levels
      game.randomizer
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
