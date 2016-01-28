
#MasterMind should only be the face of the game with 3 options only play, instructions, or quit. single responsiblity.
class MasterMind


  def game_intro(option)
    "Welcome to MASTERMIND"\n "Would you like to #{(p)lay}, read the #{(i)nstructions)}, or #{(q)uit}"
    if option == ('p') || play
      game_flow #create game_flow method
    end
    if option == ('i') || instructions
      instuct # create instuct method
    end
    if option == ('q') || quit
      quitter #create quitter method.
  end

  def player_name(name)
    "#{name}, get ready to play" #should response to all intro commands.
    "#{name}, make sure you read this!"
    "#{name}, your a quitter!"
  end

end
################################################################################

  #Does this need to be in its own class? since this is where the game is played it has no iteractions with instructions or quitting the game. it only needs to speak to to MasterMind for when the game starts and ends.
class Game

  def game_flow
    #starts the game and allows the guessing function to happen. compares the player answer to the randomized answer(color_randomizer)
  end

  def color_randomizer
    shuffle(b,r,g,y) #how do I create more then a 4 answer guess.
  end


  def quitter
    #if player decided to quit game
  end

  def cheater
    #if player decideds to cheat - set it up to have multiple cheat options - how many letters the does the player want to know.
  end

end


class Instrucciones

  def instrut
    #talks about how to play the game
  end

end

game = MasterMind.new
p game.game_intro
