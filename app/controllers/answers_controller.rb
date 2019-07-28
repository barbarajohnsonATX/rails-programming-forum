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
            flash[:notice] = "Comment saved successfully."
        else 
            flash[:alert] = "Comment failed to save."
        end 
 
        redirect_to question_path(@question)

    end 
      
    private 

    def answer_params
        params.require(:answer).permit(:comment, :user_id, :question_id )
    end 

end
