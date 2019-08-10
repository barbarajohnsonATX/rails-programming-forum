class LikesController < ApplicationController
    before_action :set_question
    before_action :set_like, only: [:destroy]

    def create
        if already_liked?
            flash[:notice] = "You already like this."
        else 
            #create association for a user to like a question
            @question.likes.create(user_id: current_user.id)
            redirect_to question_path(@question)
        end 
    end

    def destroy
        #Unliking
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
        #get the like instance associated with the question
        @like = @question.likes.find(params[:id])
     end

     def already_liked?
        #check if already Like has an entry for user_id for current_user and question_id
        Like.where(user_id: current_user.id, question_id: params[:question_id]).exists?
    end
end
