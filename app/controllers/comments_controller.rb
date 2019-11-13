class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

    def create
        @beer = Beer.find_by_id(params[:beer_id])
        @post = Post.find_by_id(params[:post_id])
        @comment = current_user.comments.create(comment_params.merge(user: current_user, post: @post))
        if @comment.invalid?
          flash[:alert] = 'Comment must include a 3-100 character message'
        end
        redirect_to beer_post_path(@beer, @post)
    end
    
    def show
        @beer = Beer.find_by_id(params[:beer_id])
        @post = Post.find_by_id(params[:post_id])
        @comment = Comment.find_by_id(params[:id])
        return render_not_found if @comment.blank?
    end

    def update
        @beer = Beer.find_by_id(params[:beer_id])
        @post = Post.find_by_id(params[:post_id])
        @comment = Comment.find_by_id(params[:id])
        return render_not_found if @comment.blank?
        return render_not_found(:forbidden) if @comment.user != current_user
        @comment.update_attributes(comment_params)
        if @comment.valid?
          redirect_to beer_post_path(@beer, @post)
        else
          return render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @beer = Beer.find_by_id(params[:beer_id])
        @post = Post.find_by_id(params[:post_id])
        @comment = Comment.find_by_id(params[:id])
        return render_not_found if @comment.blank?
        return render_not_found(:forbidden) if @comment.user != current_user
        @comment.destroy
        redirect_to beer_post_path(@beer, @post)
    end
    
      private
    
    def comment_params
        params.require(:comment).permit(:message)
    end
end
