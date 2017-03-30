require_relative "tile"

class Board
  NUM_BOMBS = 10

  def self.empty_grid
    grid = Array.new(9) do
      Array.new(9) { Tile.new(self) }
    end
  end

  def initialize(grid = Board.empty_grid)
    @grid = grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def length
    @grid.length
  end

  def width
    @grid[0].length
  end

  # def rows
  #   @grid
  # end
  def random_pos
    [rand(length), rand(width)]
  end

  def place_random_bomb
    pos = random_pos

    until empty?(pos)
      pos = random_pos
    end

    self[pos].create_bomb
  end

  def empty?(pos)
    self[pos].bomb == false
  end

  def populate
    NUM_BOMBS.times { self.place_random_bomb }
  end

  def render
    system("clear")
    puts "  #{(0..8).to_a.join(" ")}"
    @grid.each_with_index do |row, i|
      puts "#{i} #{row.map{|el| el.to_s }.join(" ")}"
    end
  end
end

b = Board.new()
b.populate
b.render
