
class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](position)
        row, column = position
        @grid[row][column]
    end

    def []=(position, value)
        row, column = position
        @grid[row][column] = value
    end

    def num_ships
        @grid.flatten.count {|ele| ele == :S}
    end

    def attack(position)
        if self[position] == :S  
            self[position] = :H
            puts "you sunk my battleship!"
            return true
        else  
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        ship_num = @size / 4
        until self.num_ships == ship_num
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            if @grid[row][col] != :S 
                @grid[row][col] = :S 
            end
        end
    end

    def hidden_ships_grid
        hidden = Array.new(@grid.length) {Array.new(@grid.length)}
        @grid.each_with_index do |sub_arr, row|
            sub_arr.each_with_index do |ele, col|
                if ele == :S  
                    hidden[row][col] = :N  
                else  
                    hidden[row][col] = ele  
                end
            end
        end
        hidden
    end

    def self.print_grid(grid)
        grid.each do |sub_arr|
            puts sub_arr.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print  
        Board.print_grid(self.hidden_ships_grid)
    end
end

