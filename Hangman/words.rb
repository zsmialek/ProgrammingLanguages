class Words

  def initialize
    @word_list ||= []
  end


  def select_word()
    word = @word_list.sample()
    puts(word)
    return word
  end


  def read_file(filename)

    if File.exist?(filename)

      File.open(filename, "r") do |f|

        f.each_line do |line|
          
          if line.count(" ") > 0
            line.split(" ").each() do |word| 
              @word_list.push(word)
              #puts(word)
            end
          else
            @word_list.push(line)
          end

        end#end of each_line

      end#end of open file

    end#end of if
  end
end
