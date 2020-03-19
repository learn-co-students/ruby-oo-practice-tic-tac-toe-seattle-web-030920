require 'pry'
class TicTacToe

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]


    attr_accessor :board
    @@all = []

    def initialize

        @board = [" "," "," "," "," "," "," "," "," "]

        @@all << self
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index (input)
        index = input.to_i - 1
    end

    def move (index, player)
        @board[index] = player
    end

    def position_taken? (index)
        @board[index] != " "
    end

    def valid_move? (index)
        (!position_taken? (index)) && (index < 9) && (index >= 0)
    end

    def turn_count
        @board.count {|index| index != " "} 
    end

    def current_player
        turn_count.even? ? "X" : "O" #counts finished turns
    end

    def turn
        puts "Please enter 1-9:"
        input = gets
        index = input_to_index (input)

        if (valid_move?(index))
            player = current_player
            move(index,player)
            display_board
        else
            puts "Please enter 1-9:"
            input = gets    
        end

    end

    def check_combo (combo, player)
        combo.all? {|int| @board[int] == player}
    end

    def won?
        win_combo = false
        WIN_COMBINATIONS.each do |combo|
            win_combo = combo if check_combo(combo, "X") || check_combo(combo, "O")
        end
        win_combo
    end

    def full?
        !@board.include?(" ")
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        (won? == false) ? nil : board[won?[0]] 
    end

    def play
        game = TicTacToe.new
        
        while !over?
            turn
        end

        case winner
        when "X" 
            puts "Congratulations X!"
        when "O" 
            puts "Congratulations O!"
        else 
            puts "Cat\'s Game!" 
        end
    end

end
