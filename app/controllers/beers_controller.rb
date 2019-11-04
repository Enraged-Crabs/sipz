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
    end

    def create
        @beer = current_user.beers.create(beer_params)
        if @beer.invalid?
          flash[:alert] = 'Beer must include a 5-100 character message & an image'
        end
        redirect_to root_path
    end

    private

    def beer_params
        params.require(:beer).permit(:name)
    end
end
