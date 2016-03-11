require_relative 'display'

class Player
  attr_accessor :color
  def initialize(board)
    @display = Display.new(board)
    @color = "white"
  end

  def move
    result = nil
    until result
      # sleep(1)
      @display.render
      result = @display.get_input
    end
    result
  end

  def toggle_color
    if @color = "white"
      @color = "black"
    else
      @color = "white"
    end
  end
end
