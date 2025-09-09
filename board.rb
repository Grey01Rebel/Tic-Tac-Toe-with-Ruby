class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9, " ")  # 9 empty spaces
  end

  def display
    puts ""
    puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
    puts "---+---+---"
    puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
    puts "---+---+---"
    puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    puts ""
  end

  def valid_move?(position)
    position.between?(1, 9) && @grid[position - 1] ==  " "
  end

  def place_marker(position, marker)
    if valid_move?(position)
      @grid[position - 1] = marker
      true
    else
      false
    end
  end
end

class Board
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],  # rows
    [0,3,6], [1,4,7], [2,5,8],  # cols
    [0,4,8], [2,4,6]            # diagonals
  ]

  # ... your old methods are still here

  def winner?(marker)
    WIN_COMBINATIONS.any? do |combo|
      combo.all? { |i| @grid[i] == marker }
    end
  end

  def full?
    !@grid.include?(" ")
  end
end
