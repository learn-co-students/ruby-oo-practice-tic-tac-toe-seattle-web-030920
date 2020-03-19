require 'pry'
class TicTacToe

    WIN_COMBINATIONS=[
        [0,1,2],[3,4,5],[6,7,8], [0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
    ]

    def initialize
        @board=[]
        9.times{@board<< " "}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(index)
        index.to_i-1
    end

    def position_taken?(position)
        @board[position] != " "
    end

    def valid_move?(index)
        if index<0 || index>9
            false
        elsif  position_taken?(index)
            false
        else 
            true
        end
    end

    def move(position,token="X")
        position_taken?(position)? false: @board[position]=token
    end

    def turn 
        puts "Pick a Spot on the Board"
        input=input_to_index(gets.chomp)
        input=input_to_index(gets.chomp) if !valid_move?(input)
        move(input, current_player)
        display_board
    end

    def check_combo(combo, letter)
        combo.all? {|int| @board[int]== letter}
    end

    def won?
        win_combo=false
        WIN_COMBINATIONS.each do |combo|
            win_combo=combo if check_combo(combo,"X") || check_combo(combo,"O")
        end
        win_combo
    end

    def full?
        !@board.include?(" ")
    end

    def draw?
        true if !won? && full?
    end

    def over?
        true if draw? || won?
    end

    def winner
        @board[won?[0]] if won?
    end

    def play
        until over?
              turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end