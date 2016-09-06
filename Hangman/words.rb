class Words

  def initialize
    @word_list ||= []
  end


  def select_word()
    word = @word_list.sample()
    return word
  end


  def read_file(filename)

    if File.exist?(filename)

      File.open(filename, "r") do |f|
        f.each_line do |line|
          @word_list.push(line)
         
        end#end of each_line

      end#end of open file

    end#end of if statment
  end

 
end
