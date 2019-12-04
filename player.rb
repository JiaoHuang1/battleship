class Player
    def get_move
        print "enter a position with coordinates separated with a space like '4 7'"
        pos = gets.chomp
        pos.split(" ").map {|n| n.to_i}
    end

end
