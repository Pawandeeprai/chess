class Piece
attr_reader  :position
  def initialize(pos, color)
    @position = pos
    @color = color
  end

  def present?
    true
  end

  def to_s
    " x "
  end

  def valid_move?(pos)
    self.valid_moves.include?(pos)
  end
end
