class AnswersController < ApplicationController

    def new
        @answer = Answer.new
    end

    def create
        #answer belongs to question and user
        @question = Question.find(params[:question_id])
        @answer = @question.answers.build(answer_params)
        @answer.user_id = current_user.id 

        if @answer.save
            #redirect_to answers_path(@answer)
            #byebug
            redirect_to question_path(@question)
        else 
            render :new
        end 

    end 
      
    private 

    def answer_params
        params.require(:answer).permit(:comment, :user_id, :question_id )
    end 

end
