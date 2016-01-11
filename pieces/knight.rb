class Knight < Piece

  MOVES = [
  [-2, -1],
  [-2,  1],
  [-1, -2],
  [-1,  2],
  [ 1, -2],
  [ 1,  2],
  [ 2, -1],
  [ 2,  1]
]

  def valid_moves
    valid_moves = []
    cur_row, cur_col = self.position

    MOVES.each do |drow, dcol|
      new_pos = [cur_row + drow, cur_col + dcol]
      valid_moves << new_pos if new_pos.all? {|el| el.between?(0, 7)}
    end
    valid_moves
  end

end
