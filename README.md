---
layout: page
title: Mastermind
---

"The Mastermind Game" -  The classic  strategy  game of logic and deduction. How many times will it take you to become the MasterMind! 

### Downloading the game

clone the following game:
https://github.com/alirezaandersen/MasterMind-.git

gem install colorize:
https://github.com/fazibear/colorize.git


### Starting a Game

* Player starts the game by running `ruby mastermind.rb`

```
Welcome to MASTERMIND

Would you like to (p)lay, read the (i)nstructions, or (q)uit?
>
```

* Type `p` or `play`  to play the game
* Type `i` or `instructions`  to get to instructions
* Type `q` or `quit`  to quit the game at anytime

### Game Flow

Once the user starts a game user should see:

```
What level would you like to play at?
	(B)eginning level with 4 characters
	(I)ntermidate level with 6 characters and 5 colors
	(A)dvance level with 8 characters and 6 colors
	Use (q)uit at any time to end the game.
```
Once the user selects the level of their choice, user should see:

for example 
If you pick beginner level you will see:
```
I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?
```

They you can enter a guess in the form `rrgb`(based on difficulty level you choose)

* Guesses are case insensitive
* If it's `'q'` or `'quit'` then exit the game
* If it's `'c'` or `'cheat'` then print out the current secret code
* If you decide to cheat then type `'c'` or `'cheat'`


As you make you guess you will receive input that will tell you the following

* If it's fewer than four letters, you will be notified that it's too short
```
"Sequence of #{rgb} elements is too short"
```
* If it's longer than four letters, you will be notified that it's too long
```
"Sequence of #{rgbrgbyr} elements is too long"
```
* For every guess that meets the proper length and valid characters you should see:
```
'RRGB' has 3 of the correct elements with 2 in the correct positions
You've taken 1 guess
```

* If you guess the secret sequence
```
Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
22 seconds.

Do you want to (p)lay again or (q)uit?
```
