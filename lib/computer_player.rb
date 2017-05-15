class ComputerPlayer

  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    legit_moves = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if @board[pos].nil?
          legit_moves << pos
          @board[pos] = mark
          return pos if @board.winner == mark
          @board[pos] = nil
        end
      end
    end
    legit_moves.shuffle.first
  end

end
