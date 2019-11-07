class BeersController < ApplicationController
  def index
    @beers = Beer.order('RANDOM()').all
  end
  
  def list
    @beers = Beer.all.order(updated_at: :desc)
  end

  def new
    @beer = Beer.new
  end

  def show
    @beer = Beer.find(params[:id])
    @post = Post.new
  end

  def create
    @beer = current_user.beers.create(beer_params)
    if @beer.invalid?
      flash[:alert] = 'Beer must include a 5-100 character message & an image'
    end
    redirect_to beer_path(@beer)
  end

  def show
    @beer = Beer.find_by_id(params[:id])
    return render_not_found if @beer.blank?
  end

  def edit
    @beer = Beer.find_by_id(params[:id])
    return render_not_found if @beer.blank?
    return render_not_found(:forbidden) if @beer.user != current_user
  end

  def update
    @beer = Beer.find_by_id(params[:id])
    return render_not_found if @beer.blank?
    return render_not_found(:forbidden) if @beer.user != current_user
    @beer.update_attributes(beer_params)
    if @beer.valid?
      redirect_to beer_path(@beer)
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @beer = Beer.find_by_id(params[:id])
    return render_not_found if @beer.blank?
    return render_not_found(:forbidden) if @beer.user != current_user
    @beer.destroy
    redirect_to root_path
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :picture)
  end
end
