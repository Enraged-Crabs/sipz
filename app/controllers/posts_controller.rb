class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def create
    @beer = Beer.find_by_id(params[:beer_id])
    @beer.posts.create(post_params.merge(user: current_user))
    if @beer.invalid?
      flash[:alert] = 'Post must include a 3-100 character caption & an image'
    else
      redirect_to beer_path(@beer)
    end
  end

  def show
    @beer = Beer.find_by_id(params[:beer_id])
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
  end

  def update
    @beer = Beer.find_by_id(params[:beer_id])
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
    return render_not_found(:forbidden) if @post.user != current_user
    @post.update_attributes(post_params)
    if @post.valid?
      redirect_to beer_post_path(@beer, @post)
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
    params.require(:post).permit(:caption, :picture)
  end
end
