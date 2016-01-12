class King < SteppingPiece
  def to_s
    "♔"
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


end
