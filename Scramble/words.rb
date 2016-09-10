class Words

  def initialize
    @word_list ||= []
  end


  def scramble_da_eggs()
    index = rand(@word_list.length())
    scrambled = @word_list[index]
    correct = @word_list[index]
    scrambled = scrambled.split(//).sort_by{rand}.join
    #puts(correct)
    return scrambled, correct
  end

  def select_word()
    word = @word_list.sample()
    return word
  end


  def read_file(filename)
    
    if File.exist?(filename)

      File.open(filename, "r") do |f|

        f.each_line() do |line|
          
          if line.count(" ") > 0
            line.split(" ").each() do |word| 
              @word_list.push(word)
            end
          else
            @word_list.push(line.chomp)
          end

        end#end of each_line

      end#end of open file

    end#end of if
    return @word_list
  end
end
