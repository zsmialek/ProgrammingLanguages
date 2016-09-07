require './words'

class Hangman

  def initialize()
    @welcome_message = "Let's play hangman"
    @init_board = ""
    @max_wrong = 5
    @used_letters = ""
    puts(@welcome_message)
  end


  def check_user_input(filename)
    if /txt/ =~ filename
      return true
    else 
      return false
    end 
  end

  def bad_guesses(bad_guess)
    @used_letters = @used_letters + bad_guess 
  end


  def game_loop(word)
    wrong_guess = 0
     
    while wrong_guess != @max_wrong
      if @init_board == word
        puts("Congratulations, you win!")
        break
      end
  
      letter_guess = user_input()
      index = check_guess(letter_guess, word)

      if index >= 0
        update_board(word, letter_guess)

      else 
        wrong_guess += 1

      end #end of if

    end #end of while
    puts("Sorry, too many bad guesses!")
  end#end of def


  def display_board(word)
    temp = ""

    word.split("").each do |i| 
      @init_board = @init_board + "_"
    end

    @init_board.each_char do |i|
      temp = temp + i + " "
    end
    puts(temp)

  end


  def update_board(word, guess)
    index = 0
    temp_board = @init_board
    word.each_char do |c|
      if c == guess
        @init_board[index] = guess
      end
      index = index + 1 
    end
    temp_board.each_char do |i|
      print("#{i} ")
    end
  end


  def check_guess(guess, word)
  
    if word.include? guess
      index = word.index(guess)
      return index
    else
      return -1
    end
  end


  def user_input()
    puts("THE WORD")
    message = "Enter your next letter or '0' to guess the answer:"
    print(message)
    user_guess = $stdin.gets.chomp()
    
    return user_guess
  end

  def guess_answer(word)
    puts("What's the word?")
    word_guess = $stdin.gets.chomp()
    
    if word_guess == word
      puts("That is correct, you win!")
    else 
      puts("That is not correct, you lose!")
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

