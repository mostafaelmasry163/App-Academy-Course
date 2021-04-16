require_relative "board"
require_relative "player"

class Battleship
attr_reader :board, :player

    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = board.size / 2
    end

    def start_game
        board.place_random_ships
        puts "there is #{board.num_ships} ships on the board"
        board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else
            return false
        end
    end

    def win?
        remaining_ships = board.num_ships
        if remaining_ships == 0
            puts "you win"
            return true
        else
            return false
        end
    end

    def game_over?
     self.win? || self.lose?
    end

    def turn
       pos = player.get_move
       @remaining_misses -=1 if !board.attack(pos)
       board.print
       puts "#{@remaining_misses} remaining misses"
    end


end
