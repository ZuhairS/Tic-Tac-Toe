class Board

  attr_reader :grid

  def initialize(grid = Array.new(3) { Array.new(3) })
    @grid = grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def place_mark(pos, mark)
    raise "This position is already marked." if !self[pos].nil?
    self[pos] = mark
  end

  def empty?(pos)
    self[pos].nil? ? true : false
  end

  def winner
    %i[X O].each do |mark|
      return mark if cols_win?(mark)
      return mark if rows_win?(mark)
      return mark if diag1_win?(mark)
      return mark if diag2_win?(mark)
    end

    nil
  end

  def over?
    return true if winner == :O || winner == :X
    return true if !@grid.flatten.include?(nil)
    false
  end

  private

  def cols_win?(mark)
    (0..2).each do |row|
      return true if (0..2).all? do |col|
        pow = [row, col]
        self[pow] == mark
      end
    end
    false
  end

  def rows_win?(mark)
    (0..2).each do |col|
      return true if (0..2).all? do |row|
        pow = [row, col]
        self[pow] == mark
      end
    end
    false
  end

  def diag1_win?(mark)
    (0..2).all? do |rowcol|
      pow = [rowcol, rowcol]
      self[pow] == mark
    end
  end

  def diag2_win?(mark)
    diag2 = [[0, 2], [1, 1], [2, 0]]
    diag2.all? { |pow| self[pow] == mark }
  end

end
