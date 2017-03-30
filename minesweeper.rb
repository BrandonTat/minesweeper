require_relative "board"

class Minesweeper

  def initialize(board)
    @board = board
  end

  def get_pos
    pos = nil
    until pos && valid_pos?(pos)
      puts "Please enter a position on the board (e.g., '3,4')"
      print "> "
      pos = gets.chomp.split(",").map { |num| Integer(num) }
    end

    pos
  end

  def get_val
    val = nil
    until val && valid_val?(val)
      puts "Please enter 'f' for flagged or 'r' for reveal"
      print "> "
      val = gets.chomp.downcase
    end

    val
  end

  def valid_pos?(pos)
    pos.is_a?(Array) && pos.length == 2 &&
    pos[0].between?(0,@board.length-1) && pos[1].between?(0,@board.width-1)
  end

  def valid_val?(val)
    val == "r" || val == "f"
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  game = Minesweeper.new(b)
  game.run
end
