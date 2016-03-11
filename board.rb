require_relative 'pieces'
require 'byebug'
class Board

  SIZE = 8
  def initialize(cpy = false)
    @grid = Array.new(SIZE){Array.new(SIZE){NullPiece.new}}
    populate unless cpy
  end

  def populate
    populate_kings
    populate_queens
    populate_bishops
    populate_knights
    populate_rooks
    populate_pawns
  end

  def populate_kings
    set_piece([0,4],King.new([0,4],'black',self))
    set_piece([7,4],King.new([7,4],'white',self))
  end

  def populate_queens
    set_piece([0,3],Queen.new([0,3],'black',self))
    set_piece([7,3],Queen.new([7,3],'white',self))
  end

  def populate_bishops
    set_piece([0,2],Bishop.new([0,2],'black',self))
    set_piece([0,5],Bishop.new([0,5],'black',self))
    set_piece([7,2],Bishop.new([7,2],'white',self))
    set_piece([7,5],Bishop.new([7,5],'white',self))
  end

  def populate_knights
    set_piece([0,1],Knight.new([0,1],'black',self))
    set_piece([0,6],Knight.new([0,6],'black',self))
    set_piece([7,1],Knight.new([7,1],'white',self))
    set_piece([7,6],Knight.new([7,6],'white',self))
  end

  def populate_rooks
    set_piece([0,0],Rook.new([0,0],'black',self))
    set_piece([0,7],Rook.new([0,7],'black',self))
    set_piece([7,0],Rook.new([7,0],'white',self))
    set_piece([7,7],Rook.new([7,7],'white',self))
  end

  def populate_pawns
    rows[1].each_with_index do |piece,idx|
      set_piece([1,idx],Pawn.new([1,idx],'black',self))
    end
    rows[6].each_with_index do |piece,idx|
      set_piece([6,idx],Pawn.new([6,idx],'white',self))
    end
  end

  def check?(color)
    @grid.each do |axis|
      axis.each do |piece|
        return true if piece.color != color && piece.check?
      end
    end
    false
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, piece)
    set_piece(pos,piece)
  end

  def set_piece(pos,piece)
    piece.set_pos(pos)
    @grid[pos[0]][pos[1]] = piece
  end

  def won?
    false
  end

  def select_piece(pos)
    self[pos].valid_moves
  end

  def in_bounds?(pos)
    pos.all? {|position| position.between?(0, SIZE - 1)}
  end

  def rows
    @grid
  end

  def deep_dup
    cpy = Board.new(true)
    @grid.each_with_index do |row, rowIdx|
      row.each_with_index do |piece, colIdx|
        cpy.set_piece([rowIdx,colIdx], piece.piece_dup(cpy)) unless piece.class == NullPiece
      end
    end
    cpy
  end
end
