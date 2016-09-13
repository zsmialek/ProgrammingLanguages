require './words'

class Scramble


  def initialize(scrambled, correct, word_list,word_obj)
    #puts("Scrambled: #{scrambled} Correct: #{correct}")
    @scrambled_word = scrambled
    @correct_word = correct
    @all_words = word_list
    @word_obj = word_obj
    @num_of_replays = 0
    @max_number_replays = @all_words.length()

    welcome()
    scramble_game(scrambled)    
  end
  

  def welcome()
    welcome_message = "\nWelcome to a simple guessing game! Let's play\n"
    puts(welcome_message) 
  end
  
  
  def restart()
    print("Continue? (Y / N): ")
    replay = $stdin.gets.chomp()

    if replay.downcase() == "y" && @num_of_replays != @max_number_replays 
      @num_of_replays += 1
      word_pair = @word_obj.scramble_da_eggs()
      @correct_word = word_pair[1]
      @scrambled_word = word_pair[0]
      scramble_game(@scrambled_word)

    elsif replay.downcase() == "n"
      puts("Thanks for playing, bye now")

    else
      puts("Number of retires hit, bye now")
    end
  end
  

  def check_word(user_guess)
    if user_guess == @correct_word
      puts("That is correct!")
      puts("\n")
      restart()
    else 
      puts("Sorry, thats not correct :(...")
      puts("\n")
      restart()
    end
  end


  def scramble_game(word)
    puts("Scrambled word: #{word}")
    print("What's the word? ")
    user_guess = $stdin.gets.chomp()
    check_word(user_guess)
  end


  def []()ind
    self.fetch(ind)
  end
end

if ARGV.empty?
  filename = "other_words.txt"
else
  filename = ARGV[0]
end

word = Words.new
word_list = word.read_file(filename)
word_pair = word.scramble_da_eggs()
scrambled = word_pair[0]
correct = word_pair[1]
x = Scramble.new(scrambled, correct, word_list, word)

