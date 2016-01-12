class Rook < SlidingPiece
  def to_s
    "♖"
  end

  def valid_moves
    valid_xy
  end
end
