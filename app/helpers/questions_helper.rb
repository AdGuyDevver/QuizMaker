module QuestionsHelper

    def next_num
      @quiz.questions.count + 1
    end

end
