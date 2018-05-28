require_relative "piece"
class Board 
  
  def initialize 
    top = Array.new(2) { Array.new(8, Piece.new) } 
    mid = Array.new(4) { Array.new(8) }
    bottom = Array.new(2) { Array.new(8, Piece.new) }
    @grid = top + mid + bottom 
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end 
  
  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end 
  
end

p @grid