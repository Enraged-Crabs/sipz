class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
  def index
    @posts = Post.order('RANDOM()').all
  end

  def list
    @posts = Post.all.order(updated_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.invalid?
      flash[:alert] = 'Post must include a 5-100 character message & an image'
    end
    redirect_to root_path
  end

  def show
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
  end

  def edit
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
    return render_not_found(:forbidden) if @post.user != current_user
  end

  def update
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
    return render_not_found(:forbidden) if @post.user != current_user
    @post.update_attributes(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
    return render_not_found(:forbidden) if @post.user != current_user
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:caption)
  end
end
