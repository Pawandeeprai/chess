module Slidables
  def valid_xy
    directions = [[0,1],[0,-1],[1,0],[-1,0]]
    slide(directions)
  end

  def valid_diag
    directions = [[1,1],[1,-1],[-1,1],[-1,-1]]
    slide(directions)
  end

  def slide(directions)
    new_pos = []
    directions.each do |direction|
      current_pos = @position
      step_array = []
      while @board.in_bounds?(current_pos)
        current_pos[0] += direction[0]
        current_pos[1] += direction[1]
        step_array << current_pos
      end
      new_pos << step_array
    end
    new_pos
  end
end
