require_relative 'board'
require_relative 'player'
require 'byebug'
class Chess
  attr_accessor :board
  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  def play
    puts "Play Chess"
    until @board.won?
      origin = @player.move
      valid_moves = @board.select_piece(origin)
      destination = @player.move
      if valid_moves.include?(destination)
        @board.set_piece(destination, @board[origin])
        @board.set_piece(origin, NullPiece.new)
      end
      @player.toggle_color
      @board.checkmate?(@player.color)
    end
    puts "Hooray, #{@player.color} wins!"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Chess.new.play
end
