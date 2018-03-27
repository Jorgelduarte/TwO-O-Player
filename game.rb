require './player'
require './turn'

class Game
    attr_accessor :player1, :player2

    def initialize
        @player1 = Player.new('Player 1')
        @player2 = Player.new('Player 2')
    end

    def play
        self.check
    end

    def match
        if player1.turn
            Turn.new(self.player1).play
            self.player1.turn = false
            self.player2.turn = true
        else
            Turn.new(self.player2).play
            self.player1.turn = true
            self.player2.turn = false
        end
        self.status
        self.check
    end

    def check
        if self.player1.lives === 0
            puts "-->"
            puts "-->"
            puts "Player 2 win with a score of #{player2.lives}/3"
            puts "===== Game Over ====="
            puts "Good Bye!"

        elsif self.player2.lives === 0
            puts "-->"
            puts "-->"
            puts "Player 1 win with a score of #{player1.lives}/3"
            puts "===== Game Over ====="
            puts "Good Bye!"
        else
            self.match
        end
    end

    def status
        puts "P1: #{player1.lives}/3 Vs P2: #{player2.lives}/3"
    end
end