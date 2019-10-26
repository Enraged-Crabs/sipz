class BeersController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]    
    
    def index
        @beers = Beer.all.order(updated_at: :desc)
    end

    def new
        @beer = Beer.new
    end

    ##def show
        ## @beer = 
        ## @post = Post.new
    ##end

    def create
        @beer = current_user.beers.create(beer_params)
        if @beer.valid?
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def beer_params
        params.require(:beer).permit(:message)
    end
end