class DSL
  def initialize()
    @rules_file = ""
  end


  def quit()
    puts("Exiting")
  end


  def main_menu()
    
    menu_options = "<<<Main Menu>>>\n1.Load Rules\n2.Process Order\n3.End"
    puts(menu_options)

    selection = user_selection().to_i
    puts("Your option is #{selection}")

    #FIX clunky needs to enum like.
    if selection == 1
      open_file()
    elsif selection == 2
      process_rules()
    elsif selection == 3
      quit()
    else
      puts("Invaild Selection, please try again: ")
      main_menu()
    end
  end


  def user_selection()
    user_select_prompt = "Please enter a selection: "
    print(user_select_prompt)
    selection = $stdin.gets.chomp()
    return selection
  end


  def open_file()
    file_prompt = "Enter file containing rules: "
    print file_prompt
    file_name = $stdin.gets.chomp()
    exist = File.file?(file_name)

    if exist==false
      puts("Cannot find file")
      open_file()
    else
      puts("Loading Rule Please Wait...")
      @rules_file = file_name
      load 'rules.qm'
      #main_menu()
    end
  end
end

order = DSL.new()
order.main_menu()
