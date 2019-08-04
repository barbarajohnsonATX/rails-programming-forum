class Admin::QuestionsController < Admin::ApplicationController
    before_action :set_question
    before_action :set_answer
    
    def show
    end 

    def edit 
    end 

    def update 
        if @answer.update(answer_params)
            redirect_to admin_question_path(@question)
        else 
            render :edit 
        end 
    end 

    def destroy 
        @answer.destroy
        redirect_to admin_question_path(@question)
    end 

    private 

    def set_question
        @question = Question.find(params[:question_id])
    end 

    def set_answer
        @answer = @question.answers.find(params[:id])
    end 

    def answer_params
        params.require(:answer).permit(:comment, :user_id, :question_id )
    end 
end 
