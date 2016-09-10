require './words'

class Hangman

  def initialize(filename)
    @welcome_message = "Let's play hangman"
    @init_board = ""
    @max_wrong = 5
    @used_letters = ""
    @filename = filename
    puts(@welcome_message)
  end


  def get_default_filename()
    filename = Dir.glob('**/*.txt')
    
    return filename 
  end

  def bad_guesses(letter, guesses_left)
    @used_letters = @used_letters + letter
    puts("Bad guesses (only #{guesses_left} left): #{@used_letters}")
  end


  def restart()
    @used_letters = ""
    @init_board = ""
    new_word = Words.new
    new_word.read_file(@filename) 
    game_word = new_word.select_word()
    game_word = game_word.downcase
    display_board(game_word)
    game_loop(game_word)

  end


  def too_many_guess(word)

    puts("Sorry, too many bad guesses!")
    puts("Enter 'q' to quit or any other character for another game: ")
    
    user_input = $stdin.gets.chomp()

    if user_input == 'q'
      puts("Thanks for playing")
    else
      restart()
    end
  end


  def game_loop(word)
    wrong_guess = 0
    replay = "" 
    while wrong_guess != @max_wrong
      if @init_board == word
        puts("\nCongratulations, you win!")
        puts("Enter 'q' to quit or any other character for another game:")
        replay = $stdin.gets.chomp()

        if replay == "q"
          puts("Thanks for playing")
          break
          wrong_guess = @max_wrong
        else
          restart()
        end
      end
  
      letter_guess = user_input()
      if letter_guess == "0"
        guess_answer(word)
        break
      end

      index = check_guess(letter_guess, word)

      if index >= 0
        update_board(word, letter_guess)

      else 
        wrong_guess += 1
      
      end #end of if
      bad_guesses(letter_guess, @max_wrong - wrong_guess)
    end #end of while
    
  end#end of def
  def end_game()
    puts("Exiting hangman")
  end

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
    #puts("THE WORD")
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
end


word = Words.new

filename = ""

ARGV.each do|a|
  filename =  a
end

if filename == ""
  filename = "otherWords.txt"
end

game = Hangman.new(filename)
word.read_file(filename)
guess = word.select_word()
game.display_board(guess.downcase)
game.game_loop(guess)

