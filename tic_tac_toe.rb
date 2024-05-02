# frozen_string_literal: true

class TicTacToe
  attr_accessor :player1, :player2, :board

  def initialize
    @player1 = ''
    @player2 = ''
    @board = "1 | 2 | 3\n__|___|___\n4 | 5 | 6\n__|___|___\n7 | 8 | 9\n  |   |\n"
  end
end
