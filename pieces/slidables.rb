require 'byebug'
module Slidables
  def valid_xy
    valid_moves = []
    directions = [[0,1],[0,-1],[1,0],[-1,0]]
    valid_moves += generate_slides(directions)
    valid_moves = filter_blocks(valid_moves)
    valid_moves = valid_moves.flatten(1)
    valid_moves = filter_check?(valid_moves)
  end

  def valid_forcedxy
    valid_moves = []
    directions = [[0,1],[0,-1],[1,0],[-1,0]]
    valid_moves += generate_slides(directions)
    valid_moves = filter_blocks(valid_moves)
    valid_moves = valid_moves.flatten(1)
  end

  def valid_forceddiag
    valid_moves = []
    directions = [[1,1],[1,-1],[-1,1],[-1,-1]]
    valid_moves += generate_slides(directions)
    valid_moves = filter_blocks(valid_moves)
    valid_moves = valid_moves.flatten(1)
  end

  def valid_diag
    valid_moves = []
    directions = [[1,1],[1,-1],[-1,1],[-1,-1]]
    valid_moves += generate_slides(directions)
    valid_moves = filter_blocks(valid_moves)
    valid_moves = valid_moves.flatten(1)
    valid_moves = filter_check?(valid_moves)
  end

  def generate_slides(directions)
    sliding_moves = []
    directions.each do |direction|
      current_pos = @position.dup
      step_array = []

      current_pos = increment_pos(current_pos,direction)
      while @board.in_bounds?(current_pos)
        step_array << current_pos.dup
        increment_pos(current_pos,direction)
      end
      sliding_moves << step_array
    end
    sliding_moves
  end

  def filter_blocks(moves)
    filtered_moves = []
    moves.each_with_index do |axis,axis_index|
      stop_idx = axis.length-1
      axis.each_with_index do |pos, idx|
        if @board[pos].color == @color
          stop_idx = idx-1
        elsif @board[pos].color != nil
          stop_idx = idx
        end
      end
      filtered_moves << axis[0..stop_idx] unless stop_idx == -1
    end
    filtered_moves
  end

  def filter_check?(moves)
    filtered_moves = []
    a = @position[0]
    b = @position[1]
    moves.each do |pos|
      cpy = @board.deep_dup
      cpy.set_piece([a,b], NullPiece.new)
      cpy.set_piece(pos,self.class.new(pos,@color,cpy))
      filtered_moves << pos unless cpy.check?(@color)
    end
    filtered_moves
  end

  # helper methods
  def increment_pos(pos,inc)
    pos[0] += inc[0]
    pos[1] += inc[1]
    pos
  end
end
