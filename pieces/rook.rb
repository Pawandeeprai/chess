class Rook < SlidingPiece
  def to_s
    "♖ "
  end

  def valid_moves
    valid_xy
  end

  def valid_forced
    valid_forcedxy
  end
end
