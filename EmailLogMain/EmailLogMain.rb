#!/usr/bin/ruby
require 'minitest/autorun'

class EmailLogMain

  def initialize(file_name = "mail.log")

    @File_name = file_name
    @words = Array.new
    @message_id = ""
    @timestamp = ""
    @from_address = ""
    @to_address = ""
  end


  def output
    
  end


  def extract_data(email_data)
    

  end


  def get_message_id(email_info) #The message id (?<=id=<).+(?=>)
    

  end


  def get_date_and_time(email_info) #The date/time
#\A.{0,15}

  end

  def get_message_size(email_info) #The message size
#(?<=size=)\S.+(?=,)

  end


  def get_from_address(email_info) #The from address


  end


  def get_to_address #The to address(es)
#(?<=from=<).+(?=>,) (NOt sure rubular is down)
  end


  def get_message_number(email_info)
    email_info =~ /(?<=: )[A-Z0-9]+(?=:)/
    puts $~.to_s
  end


  def getMessageNumber(str)
    str =~ /(?<=: )[A-Z0-9]+(?=:)/
    var = $~.to_s
#puts var
  end


  def makeHash
#emailStore = ''
    msgNumber = ''
    theHash = Hash.new

    aFile = File.new(@File_name, "r")
    @words = IO.readlines(aFile)
    aFile.close

    @words.each{|block| 
    msgNumber = getMessageNumber(block)

    if theHash.key?(msgNumber)
      emailStore = theHash[msgNumber]
	#puts "BEFORE #{emailStore}"
      emailStore = emailStore.to_s + " " + block.to_s
	#puts "AFTER #{emailStore}"
      theHash.delete(msgNumber) 
      theHash.store(msgNumber, emailStore)
      emailStore = ""

    else
      puts "The hash for key #{msgNumber} is #{block}"
      theHash.store(msgNumber, block)

    end
  }
  return theHash
  end
end

e = EmailLogMain.new
hash = Hash.new
hash = e.makeHash

hash.each{ |key,value| 
puts "The HASH VALUE FOR #{key} IS #{value} @@@@@@@@@@@@@@@@@"}

