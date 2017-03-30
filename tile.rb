class Tile
  attr_reader :bomb, :flagged, :reveal

  def initialize
    @bomb = false
    @flagged = false
    @reveal = false
  end

  def flagged
    @flagged = @flagged ? false : true
  end

  def create_bomb
    @bomb = true
  end

  def reveal
  end

  def neighbors
  end

  def neighbor_bomb_count
  end
end
