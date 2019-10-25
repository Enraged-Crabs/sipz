class SipsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
  def index
    @sips = Sip.all.order(updated_at: :desc)
  end

  def posts
    @sips = Sip.all.order(updated_at: :desc)
  end

  def new
    @sip = Sip.new
  end

  def create
    @sip = current_user.sips.create(sip_params)
    if @sip.invalid?
      flash[:alert] = 'Post must include a 5-100 character message & an image'
    end
    redirect_to root_path
  end

  def show
    @sip = Sip.find_by_id(params[:id])
    return render_not_found if @sip.blank?
  end

  def edit
    @sip = Sip.find_by_id(params[:id])
    return render_not_found if @sip.blank?
    return render_not_found(:forbidden) if @sip.user != current_user
  end

  def update
    @sip = Sip.find_by_id(params[:id])
    return render_not_found if @sip.blank?
    return render_not_found(:forbidden) if @sip.user != current_user
    @sip.update_attributes(sip_params)
    if @sip.valid?
      redirect_to sip_path(@sip)
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sip = Sip.find_by_id(params[:id])
    return render_not_found if @sip.blank?
    return render_not_found(:forbidden) if @sip.user != current_user
    @sip.destroy
    redirect_to root_path
  end

  private

  def sip_params
    params.require(:sip).permit(:message)
  end
end
