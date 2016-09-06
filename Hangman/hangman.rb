require './words'

class Hangman


  def initialize()
    @welcome_message = "Let's play hangman"
    puts(@welcome_message)
  end


  def check_user_input(filename)
    if /txt/ =~ filename
      return true
    else 
      return false
    end 
  end


  def game_loop(word)
    puts("game loop word")
    puts(word)
    letter_guess = user_input() 
  end

  def display_board(word)
     
     init_board = ""
     word.split("").each do |i| 
      init_board = init_board + "_ "
      puts(init_board)
    end
    puts(word)
    #puts(init_board)
  end

  def update_board(guess, word)
    
  end

  def check_guess(guess, word)

    
  end

  def user_input()
    puts("Please enter a letter to guess or 0 to guess word")
    letter = gets
    puts(letter)
  end


end


word = Words.new
game = Hangman.new

filename = ""

ARGV.each do|a|
  filename =  a
end

find = game.check_user_input(filename)
word.read_file(filename)
guess = word.select_word()
game.display_board(guess)
game.game_loop(guess)

