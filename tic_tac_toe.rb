# frozen_string_literal: true

class TicTacToe
  attr_accessor :player1, :player2, :board

  def initialize
    @player1 = ''
    @player2 = ''
    @board = "1 | 2 | 3\n__|___|___\n4 | 5 | 6\n__|___|___\n7 | 8 | 9\n  |   |\n"
  end

  protected

  def chosen_players
    print "Name of Player 1:\t"
    @player1 = gets.chomp
    print "\nName of Player 2:\t"
    @player2 = gets.chomp
  end

  def player_turn(counter)
    if counter.even?
      player1
    else
      player2
    end
  end

  def change_board(counter)
    print "\nSelect the Placement of your marker (1-9):\t"
    placement = gets.chomp
    if ('1'..'9').to_a.include?(placement)
      @board = board.tr(placement, player_turn(counter) == player1 ? 'X' : 'O')
    else
      puts "\nInvalid input."
      change_board(counter)
    end
  end

  def board_arr
    board.split('').select { |char| ('1'..'9').include?(char) || char == 'X' || char == 'O' }
  end
end
