class ComputerPlayer

  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move(board)
    legit_moves = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if display(board)[pos].nil?
          legit_moves << pos
          display(board)[pos] = mark
          if board.winner == mark
            display(board)[pos] = nil
            return pos
          end
          display(board)[pos] = nil
        end
      end
    end
    legit_moves.shuffle.first
  end

end
