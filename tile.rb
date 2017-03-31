require_relative "board"
require "byebug"

class Tile

  attr_reader :bomb, :flagged, :reveal

  def initialize(board, pos)
    @board = board
    @pos = pos
    @bomb = false
    @flagged = false
    @reveal = false
    @neighbors = self.neighbors
  end

  # def length
  #   @board.length
  # end
  #
  # def width
  #   @board[0].length
  # end

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
    debugger
    neighbor = []
    x, y = @pos
    (x-1..x+1).each do |i|
      (y-1..y+1).each do |j|
        neighbor << [i,j]
      end
    end
    neighbor.delete(@pos)
    filter_neighbors(neighbor)
  end

  def filter_neighbors(array)

    array.reject do |arr|
      #HARD CODED (Should change to @board.length later)
      (arr[0] < 0 || arr[0] > 8) ||
      (arr[1] < 0 || arr[1] > 8)
    end
  end

  def neighbor_bomb_count
    @neighbors.count { |pos| @board[pos].bomb }
  end
end
