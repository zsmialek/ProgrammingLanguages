require 'minitest/autorun'

=begin
This exercise practices basic Ruby syntax.
=end

class WordGame
=begin
  word_score calculates a simple score for a word, which is the 
  length of the word + the frequency of the letter repeated most 
  (e.g., score for hello is length (5) + frequency (2, for l))
=end
  def word_score(word)
    return count_letters(word) + word.length()
  end

=begin
  count_letters returns the frequency of the letter repeated most often.
  For practice, you MUST:
  - use a hash table
  - use the .each syntax to iterate the hash after it's created (to determine
  the max)
  Hint: 
  - I used each_char to iterate over the word. This is not available in Ruby 1.8.x. 
=end
  def count_letters(word)
    table = Hash.new
    freq ||= []
    word.split("").each do |i|
      table[i] = word.count(i)
      freq.push(word.count(i))
    end
  return freq.max()
  end

=begin
  leader_board displays the top 3 scores + remaining total (if > 3). See the
  screenshot in the writeup. 
  For practice, you MUST:
  - use a conditional return value to set Lone wolf vs Top Dog
  - use parallel assignment and a splat to extract the 3 top scores put the rest 
  in an array
  - use a .each iterator to calculate the sum of the remaining scores 
  - use unless as an expression modifier to control whether the remaining
  scores are displayed (not that the first 3 lines always show up, the remaining
  only shows up if there are >3 scores)
  - make use of display_score to actually display the scores
=end

  def leader_board(scores)
    first_score, second_score, thrid_score, *rest_scores = scores
    rank = if scores.length() == 1 then ["first"]
           elsif scores.length() == 2 then ["first", "second"]
           else ["first", "second", "third"]
     end
    display_score(scores, rank)
  end

=begin
  display_score either displays "The (which score) score is (value)" OR
  "There is no (which score) score". See the screenshot
  For practice you MUST:
  - use string interpolation
=end
  def display_score score, rank

    first_score, second_score, thrid_score, *rest_scores = score
    score_str = if score.length() == 1 then "Lone Wolf"
                else "Top Dog"
    end
    
    puts("We have a #{score_str}")
    puts("The #{rank.at(0)} score is #{first_score}")
    if score.length() == 1 then puts("There is no second score #{"\n"}", 
                                      "There is no third score")
    elsif score.length() == 2 then puts("The #{rank.at(1)} score is #{second_score} #{"\n"}",
                                        "There is no third score")
    else puts("The #{rank.at(1)} score is #{second_score} #{"\n"}",
              "The #{rank.at(2)} score is #{thrid_score}")
    end
    
    if rest_scores.length() == 1 then puts("The total of remaining score is #{rest_scores.at(0)}")

    elsif rest_scores.length() == 2 then puts("The total of remaining score is #{rest_scores.at(0) + rest_scores.at(1)}") 
    end
 
    puts("Congratulations to #{score_str}")
    puts("\n")
  end

=begin
  create_scores is used to create an array of scores of various lengths (specifically,
  of sizes from 1 to 8), that can be used to test the leader board and quartile displays.
  For simplicity, the first score added to the array will be 100. Each succeeding score
  will subtract 10, so the final scores array is [100,90,80,70,60,50,40,30].
  For practice you MUST:
  - use the until loop control. 
  - Notice that leader_board is called within your loop, so
  that you can ensure that it works correctly for 1, 2, 3, 4 and 5 scores.  You will 
  generate 8 scores, but to reduce clutter, you will NOT call leader_board if there are
  more than 5 scores. 
  - use an if expression modifier to control when leader_board is called
  - use << to add items to the array
=end

  def create_scores
    $i = 0
    $num = 7
    top_score = 100
    max_length = 6
    scores ||= []

     until $i > $num do 
      scores.push(top_score)
      if scores.length < max_length
        leader_board(scores)
      end
      top_score -= 10
      $i +=1
    end
  return scores 
  end

=begin
  get_quartiles and display_quartiles work together to display the totals within
  the four quartiles (i.e., [100,90] [80,70] [60,50] [40,30]). You should NOT assume
  that the array will always be of size 8.  But for simplicity you MAY assume that 
  the array size is evenly divisible by 4.  This is NOT a good assumption in general, 
  but is OK for our purposes, because the real focus is how to use yield.
  For practice you MUST:
  - use .each with a range (e.g., the indices to be included in a total can be 
  expressed as a range)
  - include a loop of your choice to calculate all four quartiles
  - when you have a quartile total, yield it to the caller
  - other bookkeeping (e.g., setting totals to 0, etc.) can be coded however you see fit.
=end
  def get_quartiles(scores)

    quartiles ||= []
    start = 0
    max = 3
    (start..max).each do |i|
      quartiles.push(scores.at(2*i) + scores.at(2*i+1))
    end
  return quartiles
  end

=begin
display_quartiles just displays the quartile totals
For practice you MUST:
- use a block, have get_quartiles yield the totals to be printed
Hint:
- you can pass parameters to methods that contain a yield (not shown in slide)
=end  
  def display_quartiles(scores)

    quartiles = get_quartiles(scores)
    
    for quart in quartiles
      yield quart if block_given?
    end
  end
end

=begin
This is a scripting language, so we do not require a "main" per se. 
The following lines of code will get executed when this script runs. 
You should not modify these lines.
=end

game = WordGame.new
puts "Showing a couple of word scores"
puts "Score for hello is: #{game.word_score("hello")} (should be 7)"
puts "Score for banana is:  #{game.word_score("banana")} (should be 9)"
puts "\nShowing the leader board, various options" 
scores = game.create_scores()
puts "\nShowing the quartiles"
game.display_quartiles(scores)
game.display_quartiles(scores) {|i| puts "Quartiles total: #{i}"}
puts "\nUnit tests follow..."

=begin
Add a unit test to test the two word scores displayed above (hello and banana)
and at least 3 others.
=end
class WordGameTest < MiniTest::Test
  @@EPSILON = 0.0001
  def test_word_score
    word_game = WordGame.new
    assert_in_delta(7, word_game.word_score("hello"),@@EPSILON)
    assert_in_delta(9, word_game.word_score("banana"),@@EPSILON)
    assert_in_delta(4, word_game.word_score("the"),@@EPSILON)
  end

  def test_count_letter
    word_game = WordGame.new
    assert_in_delta(2, word_game.count_letters("hello"),@@EPSILON)
    assert_in_delta(3, word_game.count_letters("aaa"),@@EPSILON)
  end
end
