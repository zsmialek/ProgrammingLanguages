
require 'minitest/autorun'
require './EmailLogMain.rb'
# your class must extend MiniTest::Test
class ConverterTest < MiniTest::Test
	
	@@SIZE_REGEX = /(?<=size=)\S.+(?=,)/
    @@TIMESTAMP_REGEX = /^[A-Z][a-z]{2}\W\d+\W([0-9]+):([0-5][0-9]):([0-5][0-9])/
    @@MESSAGE_ID_REGEX = /(?<=message-id=<).+(?=>)/
    @@FROM_REGEX = /(?<=from=<)(.+)@(.+)(?=>)/i
    @@TO_REGEX = /(?<=\sto=<)\S+(?=>)/i
	@@UNIQUE_ID = /(?<=: )[A-Z0-9]+(?=:)/ #USED TO DISTINGUISH THE EMAILS

	
	# method names must start with test to be automatically executed
	def test_feetToMeters
		email = EmailLogMain.new
		emailHash = email.makeHash
		emailString = emailHash["B6C161B2004"]

# START OF TESTING!
		assert(true,File.exist?(email.getFileName))
#Checks if our regular expressions find the correct items needed for our report
		assert_equal("20131211132505.999FB1B2003@toilers.Mines.EDU",email.RegexExist("messageid",emailString))#Messageid
		assert_equal("echopper@mines.edu", email.RegexExist("to",emailString)) #to email
		assert_equal("root@toilers.Mines.EDU",email.RegexExist("from",emailString)) #from email
		assert_equal("6072",email.RegexExist("size",emailString))#size
		assert_equal("B6C161B2004",email.RegexExist("uniqueid",emailString)) #uniqueID

#This test will show how many reg expression this program finds for each item
		assert_equal(3, emailString.scan(@@TO_REGEX).size)         #to email
		assert_equal(1, emailString.scan(@@MESSAGE_ID_REGEX).size) #messageid
		assert_equal(1, emailString.scan(@@SIZE_REGEX).size)       #size
		assert_equal(6, emailString.scan(@@TIMESTAMP_REGEX).size)  #Time
		assert_equal(1, emailString.scan(@@FROM_REGEX).size)       #from email
		assert_equal(6, emailString.scan(@@UNIQUE_ID).size)        #uniqueID

		#This test will check for the correct ammount of emails since every email has a unique message ID 
		#Messageid == total number of email i.e. the size of our hash		
		holdEntireString = IO.read(email.getFileName)
		assert_equal(emailHash.length, holdEntireString.scan(@@MESSAGE_ID_REGEX).size)
	end
	
	
end
