require "tic_tac_toe.rb"

describe GameBoard do 

	describe "#updateBoard" do 
		describe "update board" do 
			subject do
				GameBoard.new
			end
		end

		context "X's move occurs on top row" do 
			it "updates the top row with an 'x'" do 
				expect(subject.updateBoard(1, 'x')).to eql('x')
			end
		end

		context "O's move occurs on the top row" do 
			it "updates the top row with an 'o'" do 
				expect(subject.updateBoard(2, 'o')).to eql('o')
			end
		end

		context "X's move occurs on the middle row" do 
			it "updates the middle row with an 'x'" do 
				expect(subject.updateBoard(4, 'x')).to eql('x')
			end
		end

		context "O's move occurs on the middle row" do
			it "updates the middle row with an 'o'" do 
				expect(subject.updateBoard(6, 'o')).to eql('o')
			end
		end

		context "X's move occurs on the bottom row" do 
			it "updates the bottom row with an 'x'" do 
				expect(subject.updateBoard(8, 'x')).to eql('x')
			end
		end

		context "O's move occurs on the bottom row" do 
			it "updates the bottom row with an 'o'" do 
				expect(subject.updateBoard(9, 'o')).to eql('o')
			end
		end

		context "A move is made outside of the board's parameters" do 
			it "returns nil" do 
				expect(subject.updateBoard(10, 'x')).to eql(nil)
			end
		end
	end
end

describe GameBoard do 

	describe "taken squares" do 
		subject do 
			GameBoard.new
		end
	end

	before("#isTaken") do 
		subject.updateBoard(9, 'o')
	end

	describe "#isTaken" do 
		context "Either player attempts to take an occupied square" do 
			it "returns true" do 
				expect(subject.isTaken(9)).to eql(true)
			end
		end

		context "Either player attempts to take an unoccupied square" do 
			it "returns false" do 
				expect(subject.isTaken(7)).to eql(false)
			end
		end

		context "Either player attempts to take a non-existent square" do
			it "returns true" do 
				expect(subject.isTaken(11)).to eql(true)
			end
		end
	end
end

describe GameBoard do
	describe "check for winner in gameboard" do 
		subject do
			GameBoard.new
		end
	end

	describe "#checkForWin" do  
		context "No 3-in-a-row sequences have been made" do 
			it "returns false" do 
				expect(subject.checkForWin).to eql(false)
			end
		end
	end
end

describe GameBoard do
	describe "check for winner in top row" do 
		subject do
			GameBoard.new
		end
	end

	before("#checkForWin") do 
		subject.updateBoard(1, 'x')
		subject.updateBoard(2, 'x')
		subject.updateBoard(3, 'x')
	end

	describe "#checkForWin" do 
		context "A row is filled with matching symbols" do 

			context "X completes the top row" do 
				it "returns true" do 
					expect(subject.checkForWin).to eql(true)
				end
			end
		end
	end
end

describe GameBoard do
	describe "check for winner in middle row" do 
		subject do
			GameBoard.new
		end
	end

	before("#checkForWin") do 
		subject.updateBoard(4, 'x')
		subject.updateBoard(5, 'x')
		subject.updateBoard(6, 'x')
	end

	describe "#checkForWin" do 
		context "A row is filled with matching symbols" do 

			context "X completes the middle row" do 
				it "returns true" do 
					expect(subject.checkForWin).to eql(true)
				end
			end
		end
	end
end

describe GameBoard do
	describe "check for winner in bottom row" do 
		subject do
			GameBoard.new
		end
	end

	before("#checkForWin") do 
		subject.updateBoard(7, 'x')
		subject.updateBoard(8, 'x')
		subject.updateBoard(9, 'x')
	end

	describe "#checkForWin" do 
		context "A row is filled with matching symbols" do 

			context "X completes the bottom row" do 
				it "returns true" do 
					expect(subject.checkForWin).to eql(true)
				end
			end
		end
	end
end

describe GameBoard do
	describe "check for winner in first column" do 
		subject do
			GameBoard.new
		end
	end

	before("#checkForWin") do 
		subject.updateBoard(1, 'x')
		subject.updateBoard(4, 'x')
		subject.updateBoard(7, 'x')
	end

	describe "#checkForWin" do 
		context "A column is filled with matching symbols" do 

			context "X completes the first column" do 
				it "returns true" do 
					expect(subject.checkForWin).to eql(true)
				end
			end
		end
	end
end

describe GameBoard do
	describe "check for winner in second column" do 
		subject do
			GameBoard.new
		end
	end

	before("#checkForWin") do 
		subject.updateBoard(2, 'x')
		subject.updateBoard(5, 'x')
		subject.updateBoard(8, 'x')
	end

	describe "#checkForWin" do 
		context "A column is filled with matching symbols" do 

			context "X completes the second column" do 
				it "returns true" do 
					expect(subject.checkForWin).to eql(true)
				end
			end
		end
	end
end

describe GameBoard do
	describe "check for winner in third column" do 
		subject do
			GameBoard.new
		end
	end

	before("#checkForWin") do 
		subject.updateBoard(3, 'x')
		subject.updateBoard(6, 'x')
		subject.updateBoard(9, 'x')
	end

	describe "#checkForWin" do 
		context "A column is filled with matching symbols" do 

			context "X completes the third column" do 
				it "returns true" do 
					expect(subject.checkForWin).to eql(true)
				end
			end
		end
	end
end

describe GameBoard do
	describe "check for winner via diagonal" do 
		subject do
			GameBoard.new
		end
	end

	before("#checkForWin") do 
		subject.updateBoard(1, 'x')
		subject.updateBoard(5, 'x')
		subject.updateBoard(9, 'x')
	end

	describe "#checkForWin" do 
		context "A diagonal is made with matching symbols" do 

			context "X completes the top-left to bottom-right diagonal" do 
				it "returns true" do 
					expect(subject.checkForWin).to eql(true)
				end
			end
		end
	end
end

describe GameBoard do
	describe "check for winner via diagonal" do 
		subject do
			GameBoard.new
		end
	end

	before("#checkForWin") do 
		subject.updateBoard(3, 'x')
		subject.updateBoard(5, 'x')
		subject.updateBoard(7, 'x')
	end

	describe "#checkForWin" do 
		context "A diagonal is made with matching symbols" do 

			context "X completes the bottom-left to top-right diagonal" do 
				it "returns true" do 
					expect(subject.checkForWin).to eql(true)
				end
			end
		end
	end
end

describe GameBoard do 
	describe "return appropriate player" do 
		subject do
			GameBoard.new
		end
	end

	describe "#winningMove" do 
		context "X makes the winning move" do 
			it "returns 'Player 1'" do 
				expect(subject.winningMove('x')).to eql('Player 1')
			end
		end

		context "O makes the winning move" do 
			it "returns 'Player 2'" do 
				expect(subject.winningMove('o')).to eql('Player 2')
			end
		end
	end
end

describe TicTacToe do
	describe "validates user inputs" do 
		subject do 
			TicTacToe.new
		end
	end

	describe "#validChoice" do 
		context "Player picks a valid square" do 
			it "returns true" do 
				expect(subject.validChoice(false, '1')).to eql(true)
			end
		end
	end
end

describe TicTacToe do 
	describe "validates user inputs" do 
		subject do 
			TicTacToe.new
		end
	end

	describe "#validChoice" do
		context "Player picks a valid option" do 
			it "returns true" do 
				expect(subject.validChoice(false, 'quit')).to eql(true)
			end
		end
	end
end

describe TicTacToe do 
	describe "validates user inputs" do 
		subject do 
			TicTacToe.new
		end
	end

	describe "#validChoice" do 
		context "Player picks an invalid square" do 
			it "returns false" do
				expect(subject.validChoice(false, '10')).to eql(false)
			end
		end	
	end
end

describe TicTacToe do 
	describe "validates user inputs" do 
		subject do 
			TicTacToe.new
		end
	end

	describe "#validChoice" do 
		context "Input cannot be spelled-out" do 
			it "returns false" do 
				expect(subject.validChoice(false, 'ten')).to eql(false)
			end
		end	
	end
end