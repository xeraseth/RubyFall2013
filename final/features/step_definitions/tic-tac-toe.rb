class TicTacToe
  attr_accessor :board, :player
  attr_reader :player_symbol, :computer_symbol
  SYMBOLS = [:X, :O]

  def initialize current_player = (rand() > 0.5 ? :computer : :player), symbol = SYMBOLS.sample
    @player = "Player"
    @computers_turn = current_player == :computer ? true : false
    @player_symbol = symbol.to_sym
    @computer_symbol = @player_symbol == SYMBOLS[0] ? SYMBOLS[1] : SYMBOLS[0];

    @board = {
      :A1 => " ", :A2 => " ", :A3 => " ",
      :B1 => " ", :B2 => " ", :B3 => " ",
      :C1 => " ", :C2 => " ", :C3 => " "
    }
  end

  def welcome_player
    "Welcome #{@player}"
  end

  def current_player
    @computers_turn ? "Computer" : @player
  end

  def computer_move
    spot = computer_find_spot
    @board[spot] = @computer_symbol
    @computers_turn = !@computers_turn
    spot
  end

  def computer_find_spot
    open_spots.sample
  end

  def indicate_player_turn
    "#{@player}'s Move:"
  end

  def get_player_move
    @input = gets.chomp.upcase.to_sym
    player_move
  end

  def player_move
    @board[@input] = @player_symbol
    @input
  end

  def open_spots
    spots = []
    @board.each{|k, v| spots << k if v == " " }
    spots
  end

  def current_state
    <<-eos
        a   b   c"

     1   #{@board[:A1].to_s} | #{@board[:B1].to_s} | #{@board[:C1].to_s}
        --- --- ---
     2   #{@board[:A2].to_s} | #{@board[:B2].to_s} | #{@board[:C2].to_s}
        --- --- ---
     3   #{@board[:A3].to_s} | #{@board[:B3].to_s} | #{@board[:C3].to_s}
    eos
  end
end
