class GameBoard
	def initialize
		@rows = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
		@game_over = false
		@winner = nil
	end

	def displayBoard
		puts "Current Game Board: \n"
		puts "----+---+----\n"
		@rows.each do |row|
			puts "| " + row[0].to_s + " | " +
						row[1].to_s + " | " +
						row[2].to_s + " |\n"
			puts "----+---+----\n"
		end
		puts "\n"
	end

	def updateBoard(space, marker)
		case space
		when 1, 2, 3
			@rows[0][space - 1] = marker
		when 4, 5, 6
			@rows[1][space - 4] = marker
		when 7, 8, 9
			@rows[2][space - 7] = marker
		else
			puts "Error!"
		end
	end

	def isTaken(space)
		taken = nil
		case space
		when 1, 2, 3
			taken = !(@rows[0][space - 1].is_a? Integer)
		when 4, 5, 6
			taken = !(@rows[1][space - 4].is_a? Integer)
		when 7, 8, 9
			taken = !(@rows[2][space - 7].is_a? Integer)
		else
			taken = true
		end
		return taken
	end

	def hasWinner
		return @game_over
	end

	def checkForWin
		i = 0
		j = 0
		while i < 3
			if @rows[i][j] == @rows[i][j + 1] &&
			   @rows[i][j] == @rows[i][j + 2]
			   		@winner = winningMove(@rows[i][j])
			   		@game_over = true
			   		break
			elsif @rows[j][i] == @rows[j + 1][i] &&
				  @rows[j][i] == @rows[j + 2][i]
					@winner = winningMove(@rows[j][i])
					@game_over = true
					break
			else
				i += 1
			end
		end
		if (@rows[0][0] == @rows[1][1] &&
		   @rows[0][0] == @rows[2][2]) ||
		   (@rows[2][0] == @rows[1][1] &&
		   @rows[2][0] == @rows[0][2])#checks diagonals
		   		@winner = winningMove(@rows[1][1])
		   		@game_over = true
		end	
		@game_over
	end

	def winningMove(marker)
		if marker == 'x'
			return 'Player 1'
		else
			return 'Player 2'
		end
	end

	def winner
		return @winner
	end
end

class TicTacToe
	@@how_to_play = "HOW TO PLAY:\n" +
					"Player 1 is 'X', Player 2 is 'O'. Get three in a row to win!\n" +
					"1. Type the number of the space you want," +
					" then press 'Enter'.\n" +
					"2. Type 'quit' then press 'Enter' at anytime to quit."
	@@valid_choices = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
	def initialize
		@game = GameBoard.new
		@players_turn = '1'
		@turn = 1
		@marker = 'x'
		@choice = ''
		@prompt = "Choose a space, Player "
	end

	def validChoice(is_valid = false, choice = @choice)
		if @@valid_choices.include? choice
			is_valid = !@game.isTaken(choice.to_i)
			if !is_valid
				puts "That space is already taken!\nSo..."
			end
		elsif choice == 'quit'
			is_valid = true
		else
			is_valid = false
		end
		return is_valid
	end

	def turn
		puts @prompt + @players_turn + ":\n"
		@choice = gets.chomp.downcase()
		while !validChoice
			puts "Not a valid choice. Type a number " +
				 "for a space or 'quit' to quit the game:\n"
			@choice = gets.chomp.downcase()
		end
		if @choice != 'quit'
			@game.updateBoard(@choice.to_i, @marker)
			@game.displayBoard
		end
		@turn += 1
		turnOver()
	end

	def turnOver
		if @players_turn == '1'
			@players_turn = '2'
			@marker = 'o'
		else
			@players_turn = '1'
			@marker = 'x'
		end
	end

	def play
		puts @@how_to_play
		puts "Here is the starting board: "
		@game.displayBoard
		while !@game.hasWinner() && @turn < 10
			turn()
			if @choice == 'quit'
				@turn = 11
				break
			end
			if @turn >= 6
				@game.checkForWin
				if @game.hasWinner()
					puts @game.winner() + " Wins!"
				end
			end
		end
		if !@game.hasWinner && @turn == 10
			puts "Draw!"
		end
	end
end

def playerPrompt
	wants_to_play = true
	prompt = "Want to play a round of Tic-Tac-Toe? Y or N:\n"
	response = ''
	current_game = nil
	while(wants_to_play)
		puts prompt
		response = gets.chomp.upcase
		case response
		when 'Y'
			current_game = TicTacToe.new
			current_game.play
			prompt = "Want to play again? Y or N:"
		when 'N'
			puts "Goodbye!"
			wants_to_play = false
		else
			puts "Sorry, that's not a valid response.\n" +
				"-Enter 'Y' to play or 'N' to quit:\n"
		end
	end
end

#playerPrompt()