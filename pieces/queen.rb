class Queen < SlidingPiece
  def to_s
    "♕"
  end

  def valid_moves
    valid_xy + valid_diag
  end
end
