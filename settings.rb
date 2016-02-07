require_realtive 'mastermind'

module Settings

  def initialize
    @number_of_letters = number_of_characters
    @valid_colors =
  NUMBER_OF_LETTERS = 4
  NUMBER_OF_LETTERS_BEGINNER = 4#rand(4...12)game_difficulties

  VALID_LETTERS = ['r','b','g','y']  #game_difficulties

  def game_difficulties
    case input.downcase
    when 'b', 'beginner'
      beginner
    when 'i', 'intermidate'
      intermidate
    when 'a', 'advance'
      advance
    else
    end
  end


  def beginner
    number_of_characters = 4
    color_selection = ['r','b','g','y']

    puts "I have generated a beginner sequence with #{NUMBER_OF_LETTERS} elements made up of: #{"(r)ed".colorize(:red)}, #{"(g)reen".colorize(:green)}, #{"(b)lue".colorize(:blue)}, and #{"(y)ellow".colorize(:yellow)}."
  end

  def intermediate
    number_of_characters = 6
    color_selection = ['r','b','g','y','p']

    puts "I have generated a beginner sequence with #{number_of_characters} elements made up of: #{"(r)ed".colorize(:red)}, #{"(g)reen".colorize(:green)}, #{"(b)lue".colorize(:blue)}, #{"(y)ellow".colorize(:yellow)}, and #{"(p)urple".colorize(:purple)}."
  end

  def advance
    number_of_characters = 8
    color_selection = ['r','b','g','y','p','t','s']

    "I have generated a beginner sequence with #{number_of_characters} elements made up of: #{"(r)ed".colorize(:red)}, #{"(g)reen".colorize(:green)}, #{"(b)lue".colorize(:blue)}, #{"(y)ellow".colorize(:yellow)}, #{"(p)purple".colorize(:purple)}, #{"(t)urquoise".colorize(:turquoise)}, and #{"(s)almon".colorize(:salmon)}"
  end

end

#r = red
#b = blue
#g = green
#y = purplen
#t = turquoise
#s = salmon
