#!/usr/bin/ruby
require 'minitest/autorun'

=begin
  Zach Smialek
  Nicholas Corl

  This script takes in an email log for the server and parses out the data in a human readable format.  Please look at the assumptions made the exact nature on how the server logs
  email transactions are unknown to us
=end


class EmailLogMain

  def initialize(file_name = "mail.log")
   
    @File_name = file_name
    @words = Array.new
    @message_id = Hash.new
    @timestamp = Hash.new
    @from_address = Hash.new
    @to_address = Hash.new
    @size = Hash.new

    @SIZE_REGEX = /(?<=size=)\S.+(?=,)/
    @TIMESTAMP_REGEX = /^[A-Z][a-z]{2}\W\d+\W([0-9]+):([0-5][0-9]):([0-5][0-9])/
    @MESSAGE_ID_REGEX = /(?<=message-id=<).+(?=>)/
    @FROM_REGEX = /(?<=from=<)(.+)@(.+)(?=>)/i
    @TO_REGEX = /(?<=\sto=<)\S+(?=>)/i
    @UNIQUE_ID = /(?<=: )[A-Z0-9]+(?=:)/

  end


  def write_log(email_info)
    puts("NUMBER OF EMAILS: #{@size.size()}")
    email_info.each do |key,val|

      puts("MESSAGE ID: #{@message_id[key]}")
      puts("TIMESTAMP: #{@timestamp[key]}")
      puts("MESSGAGE SIZE: #{@size[key]}")
      puts("TO ADDRESS: #{@to_address[key]}")
      #if @to_address[key].size > 1
        #@to_addrress[key].each do |address|
	  #puts(address)
	#end
      #else
         #puts(@to_address[key])
      #end

      puts("FROM ADDRESS #{@from_address[key]}")
      puts("**********************************************NEW MESSAGE************************************")
    end
  end

=begin
  Methods using regex to extract data for the log file.  In most cases just extracts the first match, the to will grab all the to that were include in the email thread.

  ASSUMPTIONS:
    There was only one from email
    Time Stamp was repeat for the stmp and qmgr.  This only needed to be reported once.
    Message Size was that the size include all the emails for the thread, IE replies, forwards...and so on
    There was only one message id.
    Therefore this assumptions yeilded the regex results to be unique and only one occurance with the log.

=end


  def extract_data(email_info)
    email_info.each do |key, email_data|

      get_message_id(key, email_data)
      get_date_and_time(key, email_data)
      get_message_size(key, email_data)
      get_from_address(key, email_data)
      get_to_address(key,email_data)
    end
    write_log(email_info)
  end


  def get_message_id(key, email_info) #The message id (?<=id=<).+(?=>)
    email_info =~ @MESSAGE_ID_REGEX
    @message_id[key] = $~.to_s
  end


  def get_date_and_time(key, email_info) #The date/time \A.{0,15}
    email_info =~ @TIMESTAMP_REGEX
    @timestamp[key] = $~.to_s
  end


  def get_message_size(key, email_info) #The message size (?<=size=)\S.+(?=,)i
    email_info =~ @SIZE_REGEX
    @size[key] = $~.to_s
    
  end


  def get_from_address(key, email_info) #The from address
    email_info =~ @FROM_REGEX
    #if $~.to_s != nil
    @from_address[key] = $~.to_s
    #end

    #@from_address.each do |k, val|
      #puts("Key #{k} Val: #{val}")
    #end
  end


  def get_to_address(key, email_info) #The to address(es)
    found = email_info.scan(@TO_REGEX)
    
    @to_address[key] = found
  end


  def get_message_number(email_info)
    email_info =~ @UNIQUE_ID
    var = $~.to_s
     #puts var
  end


=begin
  Master Hashmap, this hashmap contains all the unique ID's in the log file.  This used to extract the info from the and refer back when it
  needs to be printed.  Reads in file, uses @UNIQUE_ID and is used to build the other hash maps.  This is the main refer point so the email
  data does not get mixed up with another email thread.
=end


 def makeHash
    msgNumber = ''
    theHash = Hash.new

    aFile = File.new(@File_name, "r")
    @words = IO.readlines(aFile)
    aFile.close

    @words.each{|block| 
    msgNumber = get_message_number(block)

    if theHash.key?(msgNumber)
      emailStore = theHash[msgNumber]
      emailStore = emailStore.to_s + block.to_s
      theHash.delete(msgNumber) 
      theHash.store(msgNumber, emailStore)
      emailStore = ""

    else
      theHash.store(msgNumber, block)

    end
  }
  return theHash
  end


   def RegexExist(str, var)
     case str
     when "messageid"
       return @MESSAGE_ID_REGEX.match(var)[0].to_s
     when "to"
       return @TO_REGEX.match(var)[0].to_s
     when "from"
       return @FROM_REGEX.match(var)[0].to_s
     when "size"
       return @SIZE_REGEX.match(var)[0].to_s
     when "uniqueid"
       return @UNIQUE_ID.match(var)[0].to_s
     when "time"
       return @TIMESTAMP_REGEX.match(var)[0].to_s
     end
   end


  #This will get the file that we are testing
  def getFileName
    return @File_name
  end
end

e = EmailLogMain.new
hash = Hash.new
hash = e.makeHash
#puts(hash)
e.extract_data(hash)
#hash.each{ |key,value| 
#puts "The HASH VALUE FOR #{key} IS #{value} @@@@@@@@@@@@@@@@@"}

