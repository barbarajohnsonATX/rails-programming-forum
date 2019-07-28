class AnswersController < ApplicationController
    before_action :check_for_logged_in
    before_action :find_question, only: [:show, :create, :edit, :update, :destroy]
    before_action :find_answer, only: [:show, :edit, :update, :destroy]

    def new
        @answer = Answer.new
    end

    def create
        #answer belongs to question and user
        #@question = Question.find(params[:question_id]) => before_action
        @answer = @question.answers.build(answer_params)
        @answer.user_id = current_user.id 

        if @answer.save
            flash[:notice] = "Comment saved successfully."
        else 
            flash[:alert] = "Comment failed to save."
        end 
 
        redirect_to question_path(@question)

    end 
    
    def show
    end 

    def edit 
    end 

    def update 
        if @answer.update(answer_params)
            redirect_to question_path(@question)
        else 
            render :edit 
        end 
    end 

    def destroy 
        @answer.destroy
        redirect_to question_path(@question)
    end 

    private 

    def find_question
        @question = Question.find(params[:question_id])
    end 

    def find_answer
         
        @answer = @question.answers.find(params[:id])
    end 

    def answer_params
        params.require(:answer).permit(:comment, :user_id, :question_id )
    end 

end
