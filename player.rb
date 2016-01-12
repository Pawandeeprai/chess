require_relative 'display'

class Player
  def initialize(board)
    @display = Display.new(board)
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
end
