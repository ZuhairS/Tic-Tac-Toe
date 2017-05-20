require 'byebug'

require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_accessor :mark, :current_player
  attr_reader :board, :player_one, :player_two

  def initialize(player_one, player_two)
    @mark = nil
    @board = Board.new
    @player_one = player_one
    @player_one.mark = :X
    @player_two = player_two
    @player_two.mark = :O
    @current_player = @player_one
  end

  def switch_players!
    @current_player = current_player == player_one ? player_two : player_one
  end

  def play_turn
    pos = current_player.get_move(board)
    mark = current_player.mark
    @board.place_mark(pos, mark)
    @player_one.display(@board)
    switch_players!
  end

  def play
    puts "Welcome to Tic-Tac-Toe: The Game\n"
    puts "Lets begin!\n"
    @player_one.display(@board)

    play_turn until @board.winner
    if @board.winner == :X
      puts "Congrats! You beat the computer!"
    else
      puts "Oops, guess the computer got the better of you this time."
      puts "\nBetter luck next time. Goodbye!"
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  me = HumanPlayer.new("Zuhair")
  pc = ComputerPlayer.new("Computer")
  game = Game.new(me, pc)
  game.play
end
