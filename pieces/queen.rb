class Queen < SlidingPiece
  def to_s
    "♕ "
  end

  def valid_moves
    valid_xy + valid_diag
  end

  def valid_forced
    valid_forcedxy + valid_forceddiag
  end
end
