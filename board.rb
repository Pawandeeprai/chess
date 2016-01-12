require_relative 'pieces'

class Board

  SIZE = 8
  def initialize
    @grid = Array.new(SIZE){Array.new(SIZE){NullPiece.new}}
    populate
  end

  def populate
    set_piece([0,0],Knight.new([0,0],'blue',self))
  end

  def [](row, col)
    @grid[row][col]
  end

  # def []=(pos, piece)
  #   @grid[pos[0]][pos[1]] = piece
  # end

  def set_piece(pos,piece)
    @grid[pos[0]][pos[1]] = piece
  end
  def won?
    false
  end

  def select_piece(pos)
    x, y = pos
    self[x,y].valid_moves
  end

  def in_bounds?(pos)
    pos.all? {|position| position.between?(0, SIZE - 1)}
  end

  def rows
    @grid
  end
end
