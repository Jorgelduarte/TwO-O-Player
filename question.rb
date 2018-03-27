class Question
    attr_accessor :q1, :q2

    def initialize
        @q1 = rand(38) + 1
        @q2 = rand(38) + 1
    end

    def ask
        "What does #{self.q1} plus #{self.q2} equal?"
    end

    def correct_answer(user_answer)
        user_answer == self.q1 + self.q2 
    end
end

