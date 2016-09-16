#Reg Ex Applied

class LogAnalyzer
  	def initialize
		@arrayOfLines = Array.new
		@hashLines = Hash.new
		@total_messages = 0
	end
	
	#Read each line of log into an array
	def fileToArray (textFile)
		File.open(textFile, "r") do |f|
			f.each_line do |line|
				@arrayOfLines << line
			end
		end
	end

	# Generate a hash table using 11 digit hex code as key.
	# Key occurs on multiple lines.
	# Append the current line to the line/lines stored at
	# that key value in the hash
	def createHashTable
		@arrayOfLines.each do |line|
			m = / [A-F0-9]{11}: /.match(line).to_s
			if (@hashLines.has_key?(m))
				@hashLines[m] = @hashLines[m] + " " + line
			else
				@hashLines[m] = line
			end
		end
	end
	
	def printMessages
		i = 0
		@hashLines.each do |key, value|
			if (value.scan(/to\=<\w+\@\w+?\.?\w+\.[a-zA-Z]+/m).size > 1)
				puts "Multiple Recipients Start:"
				ui = gets
			end
			recipients = get_recipients(value)
			recipients.each do |to|
				mTo = /\w+\@\w+\.\w+/.match(to)
				i = i + 1
				puts "##{i}"
				puts "Message ID   : #{get_messageId(value)}"
				puts "Date/Time    : #{get_dateTime(value)}"
				puts "Message Size : #{get_messageSize(value)}"
				puts "From         : #{get_fromAddress(value)}"
				puts "To           : #{mTo}"
				puts
			end
			if (value.scan(/to\=<\w+\@\w+?\.?\w+\.[a-zA-Z]+/m).size > 1)
				puts "Multiple Recipients End:"
				ui = gets
			end
		end
	end

	def get_messageId(line)
		if /message-id\=<.+>/.match(line)
			check = $~.to_s
			check.slice! "message-id=<"
			check.slice! ">"
			return check
		else
			puts "ERROR"
			ui = gets
		end
	end
	
	def get_dateTime(line)
		if /\w{3}\s\d{2}\s(\d{2}\:){2}\d{2}/.match(line)
			return $~
		else
			puts "ERROR"
			ui = gets
		end
	end
	
	def get_messageSize(line)
		if /size=\d+/.match(line)
			check = $~.to_s
			mSize = /\d+/.match(check)
			return $~
		else
			puts "ERROR"
			ui = gets
		end
	end
	
	def get_fromAddress(line)
		if /from\=<\w*\-?\w+\@\w*\.?\w+\.{1}\w+/.match(line)
			check = $~.to_s
			mFrom = /\w*\-?\w+\@\w*\.?\w+\.{1}\w+/.match(check)
			return mFrom
		else
			puts "ERROR"
			ui = gets
		end
	end
	
	def get_recipients(line)
		return line.scan(/to\=<\w+\@\w+?\.?\w+\.[a-zA-Z]+/m)
	end
end

la = LogAnalyzer.new

la.fileToArray("mail.log")
la.createHashTable
la.printMessages
