class QuestionsController < ApplicationController
    before_action :check_for_logged_in, except: [:index]
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    def index
        @questions = Question.all
    end

     def new
        @question = current_user.questions.build
    end

    def create
        @question = current_user.questions.build(question_params)

        if @question.save
           #go to question/:id
            redirect_to question_path(@question)
            flash[:notice] = "Question successfully created"
        else
            render :new
        end
    end
          
    #/category/category_id/question/:id
    def show
        #return the category that the question belongs to 
        @category = @question.category
    end


    private

    def set_question
        @question = Question.find(params[:id])
    end

    def question_params
        params.require(:question).permit(:title, :description, :category_id)
    end 

end
