class Pawn < SteppingPiece
  def initialize
    @moves = [[1,1],[0,1],[-1,1],[0,2],[1,-1],[0,-1],[-1,-1],[0,-2]]
    @initial_pos = position
    validate_moveset
  end

  def to_s
    "♙"
  end

  def validate_moveset
    if self.color = :white
      @moves.select! { |move| move[1] > 0 }
    else
      @moves.select! { |move| move[1] < 0 }
    end
  end

  def valid_moves
    @moves[0]
    @moves[2]
    @moves[1]
  end
end
