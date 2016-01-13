module Steppables
  def step(directions)
    moves = []
    posx,posy = @position
    directions.each do |dir|
      posx,posy = @position
      posx,posy = posx+dir[0],posy+dir[1]
      moves << [posx,posy] if @board.in_bounds?([posx,posy])
    end
    # puts "#{self.class} has moves #{moves}"
    # sleep(3)
    moves
  end

  def forced_moves(moves)
    valid_moves = step(moves)
    valid_moves = filter_blocks(valid_moves)
  end

  def step_valid(moves)
    moves_in_bounds = step(moves)
    filtered_moves = filter_blocks(moves_in_bounds)
    filter_check?(filtered_moves)
  end

  def filter_blocks(moves)
    filtered_moves = []
    moves.each_with_index do |move|
      filtered_moves << move unless @board[move].color == @color
    end
    filtered_moves
  end

  def filter_check?(moves)
    filtered_moves = []
    a = @position[0]
    b = @position[1]

    moves.each do |move|
      cpy = @board.deep_dup
      cpy.set_piece([a,b], NullPiece.new)
      cpy.set_piece(move, self.class.new(move,@color,cpy))
      filtered_moves << move unless cpy.check?(@color)
    end
    filtered_moves
  end


end
