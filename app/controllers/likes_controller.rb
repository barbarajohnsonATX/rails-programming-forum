class LikesController < ApplicationController
    before_action :set_question
    before_action :set_like, only: [:destroy]

    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else 
            #question has many likes
            @question.likes.create(user_id: current_user.id)
            redirect_to question_path(@question)
        end 
    end

    def destroy
        if !(already_liked?)
          flash[:notice] = "Cannot unlike"
        else
          @like.destroy
        end
        redirect_to question_path(@question)
    end
 
    private

    def set_question
        @question = Question.find(params[:question_id])
    end

    def set_like
        @like = @question.likes.find(params[:id])
     end

     def already_liked?
        Like.where(user_id: current_user.id, question_id: params[:question_id]).exists?
    end
end
