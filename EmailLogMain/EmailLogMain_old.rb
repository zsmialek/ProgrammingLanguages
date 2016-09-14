class EmailPaser

  def initialize(file_name)
    @email_string = ""
    create_email_string(file_name)
  end


  def create_email_string(file_name)
  	email_log = ""
    File.open(file_name, 'r') do |f|
      f.each_line do |line|
        @email_string = @email_string + line
      end
    end
    return @email_string
  end


  def parse_email()
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
  end

end

class Email

  def initialize()
    @message_id  = ""
    @data_time = ""
    @message_size = ""
    @from = ""
    @to = ""
  end
end

EmailPaser.new("mail.log")
