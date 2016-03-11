class Pawn < SteppingPiece
  MOVES = [[1,0],[-1,0],[2,0],[-2,0]]

  def to_s
    "♙ "
  end

  def validate_moveset(default)
    moves = default.dup
    if self.color == 'white'
      moves.select! { |move| move[0] < 0 }
    else
      moves.select! { |move| move[0] > 0 }
    end
    moves
  end

  def check_num_moves(moves)
    if @color == 'black' && @position[0] != 1
      moves.select { |move| move[0] < 2 }
    elsif @color == 'white' && @position[0] != 6
      moves.select { |move| move[0] > -2 }
    end
    moves
  end

  def attack_moves
    atk_moves = []
    row,col = @position[0], @position[1]
    if @color == 'black'
      atk_moves << [1,-1] if @board[[row+1, col-1]] != nil && @board[[row+1, col-1]].color == 'white'
      atk_moves << [1,1] if @board[[row+1,col+1]] != nil && @board[[row+1,col+1]].color == 'white'
    elsif @color == 'white'
      atk_moves << [-1,-1] if @board[[row-1,col-1]] != nil &&@board[[row-1,col-1]].color == 'black'
      atk_moves << [-1,1] if @board[[row-1,col+1]] != nil && @board[[row-1,col+1]].color == 'black'
    end
    atk_moves
  end

  def valid_moves
    moves = validate_moveset(MOVES)
    moves = check_num_moves(moves)
    moves = step_valid(moves + attack_moves)
    moves
  end

  def valid_forced
    moves = validate_moveset(MOVES)
    moves = check_num_moves(moves)
    forced_moves(moves + attack_moves)
  end
end
