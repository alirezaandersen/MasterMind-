require 'pry'
require_relative 'settings'

class Instruction

    attr_accessor :settings

  def initialize
    @settings = Settings.new

  end

  INSTRUCTIONS = "Instructions: https://github.com/turingschool/curriculum/blob/master/source/projects/mastermind.markdown"

  INPUT_TOO_SHORT = "Sequence of #{@number_of_letters} elements is too short"
  INPUT_TOO_LONG = "Sequence of #{@number_of_letters} elements is too long"
  INVALID_LETTER_USED = "Contains invalid elements"

end
