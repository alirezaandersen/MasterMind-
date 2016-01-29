require_relative 'settings'

module Constants

  include Settings

  INSTRUCTIONS = "Instructions: https://github.com/turingschool/curriculum/blob/master/source/projects/mastermind.markdown"

  INPUT_TOO_SHORT = "Sequence of #{NUMBER_OF_LETTERS} elements is too short"
  INPUT_TOO_LONG = "Sequence of #{NUMBER_OF_LETTERS} elements is too long"
  INVALID_LETTER_USED = "Contains invalid elements"
end
