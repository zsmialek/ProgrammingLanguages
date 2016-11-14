class Game

  def initialize()
    @board_one = [1,3,5,7]
    @board_two = [4,3,7]
    @board_selection = 0
    welcome_screen()
  end


  def welcome_screen()
    welcome_message = "Welcome to NIM"
    board_config_message = "Select board configuration (1-2): "

    puts(welcome_message)
    puts("1: #{@board_one} \n2: #{@board_two} \n#{board_config_message}")
    @board_selection = $stdin.gets.chomp()

  end

  
  def draw_board(user_selection)
     
  end
end


class Player
  def initalize()

  end

  def select_player()
    select_player_message = "Select computer player (1-2)"
    
  end

end

game = Game.new()
auto_play = Player.new()
