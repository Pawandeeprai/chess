require_relative 'pieces'

class Board

  SIZE = 8
  def initialize
    @grid = Array.new(SIZE){Array.new(SIZE){NullPiece.new}}
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, piece)
    @grid[row][col] = piece
  end

  def full?
    @grid.all? do |row|
      row.all? { |piece| piece.present? }
    end
  end

  def mark(pos)
    x, y = pos
    @grid[x][y] = Piece.new
  end

  def in_bounds?(pos)
    pos.all? {|position| position.between?(0, SIZE - 1)}
  end

  def rows
    @grid
  end
end
