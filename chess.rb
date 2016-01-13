require_relative 'board'
require_relative 'player'

class Chess
  attr_accessor :board
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
      # puts "Valid_Moves: #{valid_moves}"
      # sleep(5)
      destination = @player.move
      puts "Origin #{origin}"
      puts "Valid Moves #{valid_moves}"
      puts "Destination #{destination}"
      sleep(2)
      if valid_moves.include?(destination)
        @board.set_piece(destination,@board[origin])
        @board.set_piece(origin,NullPiece.new)
        puts "Set Piece: #{@board[destination]}"
        sleep(2)
      end
    end
    puts "Hooray, the board is filled!"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Chess.new.play
end
