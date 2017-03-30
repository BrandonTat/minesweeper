class Tile

  attr_reader :bomb, :flagged, :reveal

  def initialize(board, pos)
    @board = board
    @pos = pos
    @bomb = false
    @flagged = false
    @reveal = false
  end

  def my_pos

  end

  def flagged
    @flagged = @flagged ? false : true
  end

  def create_bomb
    @bomb = true
  end

  def to_s
    if @reveal
      @bomb ? "B" : "#{pos}"
    elsif @flagged
      "F"
    else
      "*"
    end
  end

  def reveal
    @reveal = true
  end

  def neighbors
  end

  def neighbor_bomb_count
  end
end
