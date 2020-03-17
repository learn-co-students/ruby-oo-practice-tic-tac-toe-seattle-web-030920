class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    attr_reader :board

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        if index < 0 || index > 8
            false
        else
            !self.position_taken?(index)
        end
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, self.current_player)
            self.display_board
        else
            self.turn
        end
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        self.turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
        WIN_COMBINATIONS.find do |combination|
            @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]] && @board[combination[2]] != " "
        end
    end

    def full?
        !@board.include? " "
    end

    def draw?
        !self.won? && self.full?
    end

    def over?
        self.won? || self.draw?
    end

    def winner
        if self.won?
            @board[won?[1]]
        end
    end

    def play
        while !self.over?
            self.turn
        end
        self.draw? ? (puts "Cat's Game!") : (puts "Congratulations #{self.winner}!")
    end

end
