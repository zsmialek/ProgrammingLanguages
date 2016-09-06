require './words'

class Hangman


  def initialize()
    @welcome_message = "Let's play hangman"
    @init_board = ""
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
    
    letter_guess = user_input()
    index = check_guess(letter_guess, word)
    puts("Index #{index}")
  end


  def display_board(word)
     
     word.split("").each do |i| 
      @init_board = @init_board + "_ "
    end
    puts(@init_board)

  end

  def update_board(guess, word)
    
  end

  def check_guess(guess, word)
    if word.index(guess).nil? 
      return word.index(guess)
    else 
      return nil
    end
  end

  def user_input()
    message = "Enter your next letter or '0' to guess the answer:"
    puts(message.chomp())
    user_guess = $stdin.gets.chomp()
    puts("Letter entered #{user_guess}")
    return user_guess
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

