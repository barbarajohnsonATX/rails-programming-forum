class QuestionsController < ApplicationController
    before_action :check_for_logged_in, except: [:index, :show]
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    def index
        @questions = Question.order('updated_at DESC')
        @categories = Category.all 
        @questions_today = @questions.created_today
        @questions_unanswered = @questions.unanswered
    end

     def new
        @question = current_user.questions.build
    end

    def create
        @question = current_user.questions.build(question_params)

        if @question.save
            #go to question/:id
            redirect_to question_path(@question)
            #render :show
            flash[:notice] = "Question successfully created."
        else
            flash[:notice] = "Question failed to save."
            render :new
        end
    end
          
    #/category/category_id/question/:id
    def show
        #return the category that the question belongs to 
        @category = @question.category
    end

    def edit
        if @question.user_id != current_user.id 
            flash[:notice] = "You are not authorized to edit this question."
            redirect_to question_path(@question)
        end 
    end

    def update         
        if @question.update(question_params)
          redirect_to question_path(@question)
        else
          render :edit
        end
    end

    def destroy 
        @question.destroy
        redirect_to questions_path
    end 

    private

    def set_question
        @question = Question.find(params[:id])
    end

    def question_params
        params.require(:question).permit(:title, :description, :category_id)
    end 

end
