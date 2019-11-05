class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end
    
    def list
        @comments = Comment.all.order(updated_at: :desc)
    end

    def new
        @comments = Comment.new
    end

    def show
        @comment = Comment.find(params[:id])
    end
    
    def create
        @comment = current_user.comments.create(comment_params)
        if @comment.invalid?
          flash[:alert] = 'Comment must include a 5-100 character message & an image'
        end
        redirect_to root_path
    end
    
    def show
        @comment = Comment.find_by_id(params[:id])
        return render_not_found if @comment.blank?
    end
    
    def edit
        @comment = Comment.find_by_id(params[:id])
        return render_not_found if @comment.blank?
        return render_not_found(:forbidden) if @comment.user != current_user
    end
    
    def update
        @comment = Comment.find_by_id(params[:id])
        return render_not_found if @comment.blank?
        return render_not_found(:forbidden) if @comment.user != current_user
        @comment.update_attributes(beer_params)
        if @comment.valid?
          redirect_to beer_path(@beer)
        else
          return render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @comment = Comment.find_by_id(params[:id])
        return render_not_found if @comment.blank?
        return render_not_found(:forbidden) if @comment.user != current_user
        @comment.destroy
        redirect_to root_path
    end
    
      private
    
    def beer_params
        params.require(:comment).permit(:message)
    end
end
