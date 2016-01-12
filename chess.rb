require_relative 'board'
require_relative 'player'

class Chess
  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  def play
    puts "Mark all the spaces on the board!"
    puts "WASD or arrow keys to move the cursor, enter or space to confirm."
    until @board.won?
      origin = @player.move
      valid_moves = @board.select_piece(origin)
      destination = @player.move
      if valid_moves.include?(destination)
        @board.set_piece(destination,Knight.new(destination,'blue',@board))
        @board.set_piece(origin,NullPiece.new)
      end
    end
    puts "Hooray, the board is filled!"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Chess.new.play
end
