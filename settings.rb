require 'pry'
require 'colorize'
require_relative 'game_flow'

class Settings

  attr_accessor :number_of_letters, :valid_colors,

  def initialize
    @number_of_letters = 0
    @valid_colors = []
  end

  def difficulty_levels
    puts "What level would you like to play at?"
    puts "\t(B)eginning level with 4 characters".colorize(:blue)
    puts"\t(I)ntermidate level with 6 characters and 5 colors".colorize(:yellow)
    puts "\t(A)dvance level with 8 characters and 6 colors".colorize(:red)
     puts "\tUse (q)uit at any time to end the game.".colorize(:light_blue)
    print ">"
  input = gets.chomp
  game_difficulties(input)
  #goes to selection module? then goes to play mode.
  end

  def game_difficulties(input)
    case input.downcase
    when 'b', 'beginner'
      beginner
    when 'i', 'intermidate'
      intermediate
    when 'a', 'advance'
      advance
    when 'q', 'quit'
      exit
    else
      beginner

    end
  end


  def beginner
    @number_of_letters = 4
    @valid_colors = ['r','b','g','y']

    puts "I have generated a beginner sequence with #{@number_of_letters} elements made up of: #{"(r)ed".colorize(:red)}, #{"(g)reen".colorize(:green)}, #{"(b)lue".colorize(:blue)}, and #{"(y)ellow".colorize(:yellow)}."
  end

  def intermediate
    @number_of_letters = 6
    @valid_colors = ['r','b','g','y','p']

    puts "I have generated a intermidate sequence with #{@number_of_letters} elements made up of: #{"(r)ed".colorize(:red)}, #{"(g)reen".colorize(:green)}, #{"(b)lue".colorize(:blue)}, #{"(y)ellow".colorize(:yellow)}, and #{"(p)urple".colorize(:light_blue)}."
  end

  def advance
    @number_of_letters = 8
    @valid_colors = ['r','b','g','y','p','m','h']

    puts "I have generated a advance sequence with #{@number_of_letters} elements made up of: #{"(r)ed".colorize(:red)}, #{"(g)reen".colorize(:green)}, #{"(b)lue".colorize(:blue)}, #{"(y)ellow".colorize(:yellow)}, #{"(p)purple".colorize(:light_blue)}, #{"(m)agenta".colorize(:magenta)}, and #{"(h)ot pink".colorize(:light_magenta)}"
  end

end

#r = red
#b = blue
#g = green
#y = purplen
#t = turquoise
#s = salmon
