class NullPiece
  def present?
    false
  end

  def set_pos(pos)
    #duck_typing
  end

  def position
  end

  def valid_moves
    []
  end

  def color
    "blank"
  end

  def check?
    nil
  end

  def to_s
    "  "
  end

end
