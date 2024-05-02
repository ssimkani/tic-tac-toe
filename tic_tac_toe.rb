# frozen_string_literal: true

class TicTacToe
  attr_accessor :player1, :player2, :board

  def initialize
    @player1 = ''
    @player2 = ''
    @board = "1 | 2 | 3\n__|___|___\n4 | 5 | 6\n__|___|___\n7 | 8 | 9\n  |   |\n"
  end

  def play
    chose_players
    counter = 0
    until who_won(counter)
      puts "\n#{player_turn(counter)}\'s turn\n\n"
      puts board
      change_board(counter)
      counter += 1
    end
    puts who_won(counter)
  end

  def who_won(counter)
    winning_indices = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

    winning_indices.each do |combination|
      return "\n#{player1} won!\n\n#{board}" if combination.to_set.subset?(indices_of_x.to_set)
      return "\n#{player2} won!\n\n#{board}" if combination.to_set.subset?(indices_of_o.to_set)
      return "\nDraw!\n\n#{board}" if counter == 9
    end
    nil
  end

  protected

  def chose_players
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

  def indices_of_x
    indices_of_x_arr = []
    board_arr.each_with_index do |value, index|
      indices_of_x_arr << index if value == 'X'
    end
    indices_of_x_arr
  end

  def indices_of_o
    indices_of_o_arr = []
    board_arr.each_with_index do |value, index|
      indices_of_o_arr << index if value == 'O'
    end
    indices_of_o_arr
  end
end

ttt = TicTacToe.new
ttt.play