# frozen_string_literal: true

require './tic_tac_toe'

RSpec.describe TicTacToe do
  let(:game) { TicTacToe.new }

  before do
    allow(game).to receive(:puts)
    game.player1 = 'Player 1'
    game.player2 = 'Player 2'
    game.rspec_test = true
  end

  describe '#who_won' do
    context 'When Player 1 wins' do
      it 'detects horizontal win' do
        game.board = " X | X | X \n---|---|---\n 4 | 5 | 6 \n---|---|---\n 7 | 8 | 9 \n"
        expected_output = "\n#{game.player1} won!\n\n#{game.board}"

        expect(game.who_won).to eq(expected_output)
      end
    end
  end
end
