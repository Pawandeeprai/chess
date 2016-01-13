class King < SteppingPiece
  def to_s
    "♔ "
  end

  MOVES = [
    [1,1],
    [1,0],
    [1,-1],
    [-1,1],
    [-1,0],
    [-1,-1],
    [0,1],
    [0,-1]
  ]

  def valid_moves
    step_valid(MOVES)
  end

  def valid_forced
    forced_moves(MOVES)
  end
end
