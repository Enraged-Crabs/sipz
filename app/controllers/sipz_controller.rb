class SipzController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]    
    
    def index
    end

    def new
        @sip = Sip.new
    end

    def create
        @sip = current_user.sipz.create(sip_params)
        if @sip.valid?
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def sip_params
        params.require(:sip).permit(:message)
    end
end
