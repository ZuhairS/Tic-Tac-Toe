class HumanPlayer

  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if !board[pos].nil?
          print board[pos].to_s
        else print " "
        end
        print " | " unless col == 2
      end
      puts "\n--------" unless row == 2
    end
  end

  def get_move
    print "Where would you like to mark? (eg: '1 2'): "
    gets.chomp.split.map(&:to_i)
  end

end
