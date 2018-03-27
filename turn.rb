require './question'
require './player'

class Turn
    attr_accessor :question, :player

    def initialize (player)
        @question = Question.new
        @player = player
    end

    def play 
        puts "-->"
        puts "-->"
        puts "---------> NEW TURN <--------"
        print "#{self.player.name}: #{self.question.ask} \n>"
        user_answer = gets.chomp.to_i
        if self.question.correct_answer(user_answer)
            puts "--"
            puts "#{self.player.name}: YES!! You are correct!"
        else
            puts "#{self.player.name}: Seriously? No!"
            self.player.count_lives(win = false)
        end
    end
end