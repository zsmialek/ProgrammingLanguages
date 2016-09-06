require './words'

class Hangman

  def check_user_input(filename)
    if /txt/ =~ filename
      return true
    else 
      return false
    end 
  end


  def game_loop(word)
  end

  def display_board(word)
    word.each() do |i|
      puts("_")
    end
  end

  def check_guess(word)
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
#game.display_board(guess)
