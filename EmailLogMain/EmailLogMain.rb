#!/usr/bin/ruby
require 'minitest/autorun'

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
    puts("Number of Emails: #{@size.size()}")
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
      emailStore = emailStore.to_s + block.to_s
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

