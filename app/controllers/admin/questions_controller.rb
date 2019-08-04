class Admin::QuestionsController < Admin::ApplicationController
     before_action :set_question, except: [:index]

    def index
        @questions = Question.order('updated_at DESC')
        @categories = Category.all 
        @questions_today = @questions.created_today
        @questions_unanswered = @questions.unanswered
      end

          
     def show
        #return the category that the question belongs to 
        @category = @question.category
        @user = @question.user 
     end

    def edit
        if @question.user_id != current_user.id 
            flash[:notice] = "You are not authorized to edit this question."
            redirect_to admin_question_path(@question)
        end 
    end

    def update         
        if @question.update(question_params)
          redirect_to admin_question_path(@question)
        else
          render :edit
        end
    end

    def destroy 
        @question.destroy
        redirect_to admin_questions_path
    end 

    private

    def set_question
        @question = Question.find(params[:id])
    end

    def question_params
        params.require(:question).permit(:title, :description, :category_id, :tag_list)
    end 

end 

