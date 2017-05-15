require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_accessor :mark, :current_player
  attr_reader :board, :player_one, :player_two

  def initialize(player_one, player_two)
    @mark = mark
    @board = Board.new
    @player_one = player_one
    @player_one.mark = :X
    @player_two = player_two
    @player_two.mark = :O
    @current_player = @player_one
  end

  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else @current_player = @player_one
    end
  end

  def play_turn
    pos = current_player.get_move
    mark = current_player.mark
    @board.place_mark(pos, mark)
    switch_players!
  end

  def play
    puts "Welcome to Tic-Tac-Toe: The Game\n"
    puts "Lets begin!"

    play_turn until @board.winner
    if @board.winner == :X
      puts "Congrats! You beat the computer!"
    else
      puts "Oops, guess the computer got the better of you this time."
      print "Try again? (y/n)"
      player_retry = gets.chomp
      new_game.play if player_retry == "y" || player_retry == "Y"
      puts "\nBetter luck next time. Goodbye!"
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  new_game = Game.new("Zuhair", "Computer")
  new_game.play
end
