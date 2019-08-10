class QuestionsController < ApplicationController
    before_action :check_for_logged_in, except: [:index, :show]
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    def index
        @questions = Question.all
        
        #@categories = Category.all
        @categories = Category.includes(:questions)

        @questions_today = @questions.created_today

        #chain scope methods
        #SELECT  "questions".* FROM "questions" WHERE "questions"."answers_count" IS NULL ORDER BY updated_at DESC LIMIT ? 
        @questions_unanswered = @questions.unanswered.order_newest
        
        @questions_most_popular = @questions.top(5)
        @questions_most_likes = @questions.most_likes(5)

      end

     def new
        @question = current_user.questions.build
    end

    def create
        @question = current_user.questions.build(question_params)

        if @question.save
            #go to question/:id
            redirect_to question_path(@question)
            flash[:notice] = "Question successfully created."
        else
            flash[:notice] = "Question failed to save."
            render :new
        end
    end
          
     def show
        #return the category that the question belongs to 
        @category = @question.category
        @user = @question.user 
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
        params.require(:question).permit(:title, :description, :category_id, :tag_list)
    end 

end
