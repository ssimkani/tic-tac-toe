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

      it 'detects vertical win' do
        game.board = " X | 2 | 3 \n---|---|---\n X | 5 | 6 \n---|---|---\n X | 8 | 9 \n"
        expected_output = "\n#{game.player1} won!\n\n#{game.board}"

        expect(game.who_won).to eq(expected_output)
      end

      it 'detects diagonal win' do
        game.board = " X | 2 | 3 \n---|---|---\n 4 | X | 6 \n---|---|---\n 7 | 8 | X \n"
        expected_output = "\n#{game.player1} won!\n\n#{game.board}"

        expect(game.who_won).to eq(expected_output)
      end
    end

    context 'When Player 2 wins' do
      it 'detects horizontal win' do
        game.board = " O | O | O \n---|---|---\n 4 | 5 | 6 \n---|---|---\n 7 | 8 | 9 \n"
        expected_output = "\n#{game.player2} won!\n\n#{game.board}"

        expect(game.who_won).to eq(expected_output)
      end

      it 'detects vertical win' do
        game.board = " O | 2 | 3 \n---|---|---\n O | 5 | 6 \n---|---|---\n O | 8 | 9 \n"
        expected_output = "\n#{game.player2} won!\n\n#{game.board}"

        expect(game.who_won).to eq(expected_output)
      end

      it 'detects diagonal win' do
        game.board = " O | 2 | 3 \n---|---|---\n 4 | O | 6 \n---|---|---\n 7 | 8 | O \n"
        expected_output = "\n#{game.player2} won!\n\n#{game.board}"

        expect(game.who_won).to eq(expected_output)
      end
    end

    context 'When it is a draw' do
      it 'detects a draw' do
        game.board = " X | O | X \n---|---|---\n O | X | O \n---|---|---\n X | X | O \n"
        expected_output = "\nDraw!\n\n#{game.board}"

        expect(game.who_won).to eq(expected_output)
      end
    end
  end

  describe '#player_turn' do
    context 'When it is Player 1 turn' do
      it 'returns Player 1' do
        current_player = game.send(:player_turn, 0)
        expect(current_player).to eq(game.player1)
      end
    end

    context 'When it is Player 2 turn' do
      it 'returns Player 2' do
        current_player = game.send(:player_turn, 1)
        expect(current_player).to eq(game.player2)
      end
    end
  end
end
