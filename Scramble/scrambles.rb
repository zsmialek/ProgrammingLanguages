require './words'

class Scramble < Words

  def initialize(scrambled)
    puts("in init")
    @scrambled_word = scrambled
    welcome()
    scramble_game(scrambled)    
  end
  

  def welcome()
    welcome_message = "Welcome to a simple guessing game! Let's play"
    puts(welcome_message) 
  end

  def scramble_game(word)
    play = true
    puts("Scrambled word: #{word}")
    print("What's the word? ")
    user_guess = $stdin.gets.chomp()
    #while play == true do
       #puts("Scrambled word: #{word}")
    #end 
  end

  def []()ind
    self.fetch(ind)
  end
end

word = Words.new
word_list = word.read_file("other_words.txt")
scrambled = word.scramble_da_eggs()
x = Scramble.new(scrambled)

