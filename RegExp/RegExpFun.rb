module RegExpFun

  def get_language(str)
    str =~ /.+(?=\sis)/
    return $~.to_s()
  end


  def get_adjective(str)
    str =~ /(\w+)$/
    return $~.to_s()
  end


  def get_price(str)
    str =~ /(?=\$).+/ 
    return $~.to_s() 
  end

  
  def is_complex(str)
    str = /\+?\-?\d*\+?\-?\d+/.match(str)
    puts(str)
    if str == nil
      return nil
    elsif(str.post_match.to_s == "i")
      return 0
    end
  end


end
