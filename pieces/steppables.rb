module Steppables
  def step(directions)
    moves = []
    current_pos = @position
    directions.each do |direction|
      current_pos[0] += direction[0]
      current_pos[1] += direction[1]
      moves << current_pos if @board.in_bounds(current_pos)
    end
    moves
  end
end
