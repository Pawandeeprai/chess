class Piece
attr_reader  :position , :color
  def initialize(pos, color, board)
    @position = pos
    @color = color
    @board = board
  end

  def correct_player?(player_color)
    @color == player_color
  end

  def present?
    true
  end

  def valid_move?(pos)
    self.valid_moves.include?(pos)
  end
end
