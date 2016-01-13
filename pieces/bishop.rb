class Bishop < SlidingPiece
  def to_s
    "♗ "
  end

  def valid_moves
    valid_diag
  end

  def valid_forced
    valid_forceddiag
  end
end
