class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("Player 1", "X")
    @player2 = Player.new("Player 2", "O")
    @current_player = @player1
  end

  def play
    until game_over?
      @board.display
      take_turn
      switch_players
    end
    @board.display
    announce_result
  end

  def take_turn
    puts "#{@current_player.name}, enter a position (1-9):"
    position = gets.chomp.to_i

    if @board.valid_move?(position)
      @board.place_marker(position, @current_player.marker)
    else
      puts "Invalid move, try again."
      take_turn   # recursion = re-ask until valid
    end
  end

  def switch_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end


  def game_over?
    @board.winner?(@current_player.marker) || @board.full?
  end

  def announce_result
    if @board.winner?(@current_player.marker)
      puts "#{@current_player.name} (#{@current_player.marker}) wins!"
    else
      puts "It's a draw!"
    end
  end
end
