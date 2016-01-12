class Bishop < SlidingPiece
  def to_s
    "♗"
  end

  def valid_moves
    valid_diag
  end
end
