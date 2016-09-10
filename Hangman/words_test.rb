require 'minitest/autorun'
require './words'

class WordsTest < MiniTest::Test
  @@EPSILSON = 0.0001

  def test_file()
    word_list =Array.new
    word = Words.new
    word_list = word.read_file("other_words.txt")
    assert_in_delta(5, word_list.size, @@EPSILSON)      
  end

 
  def test_random_word()

    word = Words.new
    count = 0
    temp = ""
    word_list = ["one", "a", "b", "two", "fish", "word", "c", "be"]
    test_word = ""

    for i in (0..20)
      temp = word_list.sample()
      if temp == test_word
        count += 1
      end

      temp = test_word
    end

    assert_operator count, :<=, 5
  end
end
