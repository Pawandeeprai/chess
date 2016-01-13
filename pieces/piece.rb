class Piece
attr_reader  :position , :color
  def initialize(pos, color, board)
    @position = pos
    @color = color
    @board = board
  end

  def set_pos(pos)
    @position = pos
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

  def check?
    self.valid_forced.each do |pos|
      return true  if @board[pos].is_a?(King) && @board[pos].color != @color
    end
    false
  end

  def piece_dup(board)
    self.class.new(@position,@color,board)
  end
end
