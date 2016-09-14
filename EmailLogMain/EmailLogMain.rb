#!/usr/bin/ruby
require 'minitest/autorun'

class EmailLogMain

  def initialize(file_name = "mail.log")

    @File_name = file_name
    @words = Array.new
    @message_id = Array.new
    @timestamp = Array.new
    @from_address = Array.new
    @to_address = Array.new
    @size = Hash.new
    @SIZE_REGEX = /(?<=size=)\S.+(?=,)/
    @TIMESTAMP_REGEX = /^[A-Z][a-z]{2}\W\d+\W([0-9]+):([0-5][0-9]):([0-5][0-9])/
    @MESSAGE_ID_REGEX = /(?<=: )[A-Z0-9]+(?=:)/
    @FROM_REGEX = //
    @TO_REGEX = //
 
  end


  def write_log()
    file_name = "parsed_email.txt"
    File.open(file_name, "w+") do |f|
      puts(f)
    end
  end


  def extract_data(email_info)
    email_info.each do |key, email_data|

      get_message_id(email_info)
      get_date_and_time(email_data)
      #get_message_size(email_data)
      #get_from_address(email_info)
      #get_to_address(email_info)
    end
    #write_log()
  end


  def get_message_id(email_info) #The message id (?<=id=<).+(?=>)
    email_info =~ @MESSAGE_ID_REGEX
    #puts($~.to_s)
  end


  def get_date_and_time(email_info) #The date/time \A.{0,15}
    #puts(email_info)
    #email_info.each do |key, email_data|
    email_info =~ @TIMESTAMP_REGEX
    #puts($~.to_s)
    @timestamp.push($~.to_s())  
    #end
   #puts(@timestamp.size)
  end


  def get_message_size(key, email_info) #The message size (?<=size=)\S.+(?=,)i
    #puts(email_info)
    email_info =~ @SIZE_REGEX
    puts($~.to_s)
    @size.push($~.to_s())

  end


  def get_from_address(email_info) #The from address


  end


  def get_to_address(email_info) #The to address(es)
#(?<=from=<).+(?=>,) (NOt sure rubular is down)
    #regex_to = /?<=to=</
    email_info.each() do |key, email_data|
      puts(email_data)
    end
  end

  def get_message_number(email_info)
    email_info =~ /(?<=: )[A-Z0-9]+(?=:)/
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
    msgNumber = get_message_number(block)

    if theHash.key?(msgNumber)
      emailStore = theHash[msgNumber]
	#puts "BEFORE #{emailStore}"
      emailStore = emailStore.to_s + " " + block.to_s
	#puts "AFTER #{emailStore}"
      theHash.delete(msgNumber) 
      theHash.store(msgNumber, emailStore)
      emailStore = ""

    else
      #puts "The hash for key #{msgNumber} is #{block}"
      theHash.store(msgNumber, block)

    end
  }
  return theHash
  end
end

e = EmailLogMain.new
hash = Hash.new
hash = e.makeHash
#puts(hash)
e.extract_data(hash)
#hash.each{ |key,value| 
#puts "The HASH VALUE FOR #{key} IS #{value} @@@@@@@@@@@@@@@@@"}

