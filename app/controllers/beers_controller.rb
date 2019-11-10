class BeersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  
  def index
    @beers = Beer.order('RANDOM()').all
  end
  
  def list
    @beers = Beer.all.order(updated_at: :desc)
  end

  def create
    @beer = current_user.beers.create(beer_params)
    if @beer.invalid?
      flash[:alert] = 'Beer must include a 3-100 character name & an image'
    else
      redirect_to beer_path(@beer)
    end
  end

  def show
    @beer = Beer.find_by_id(params[:id])
    return render_not_found if @beer.blank?
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
