require_relative 'settings'

module Constants

  include Settings

  INSTRUCTIONS = "Instructions: https://github.com/turingschool/curriculum/blob/master/source/projects/mastermind.markdown"

  INPUT_TOO_SHORT = "If it's fewer than #{NUMBER_OF_LETTERS} letters, tell them it's too short"
  INPUT_TOO_LONG = "If it's longer than #{NUMBER_OF_LETTERS} letters, tell them it's too long"
  INVALID_LETTER_USED = "Not a valid letter"
end
