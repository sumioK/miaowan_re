class CommentsController < ApplicationController

    def create
        @comment = Comment.new(
            comment: params[:comment] ,
            user_id: @current_user.id ,
            post_id: params[:post_id]
        )
        @comment.save
        redirect_to("/posts/#{params[:post_id]}")
    end

end
