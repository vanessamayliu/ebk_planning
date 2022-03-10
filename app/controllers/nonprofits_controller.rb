class NonprofitsController < ApplicationController
  before_action :current_user_must_be_nonprofit_owner_user, only: [:edit, :update, :destroy] 

  before_action :set_nonprofit, only: [:show, :edit, :update, :destroy]

  # GET /nonprofits
  def index
    @q = Nonprofit.ransack(params[:q])
    @nonprofits = @q.result(:distinct => true).includes(:owner_user, :events).page(params[:page]).per(10)
  end

  # GET /nonprofits/1
  def show
    @event = Event.new
  end

  # GET /nonprofits/new
  def new
    @nonprofit = Nonprofit.new
  end

  # GET /nonprofits/1/edit
  def edit
  end

  # POST /nonprofits
  def create
    @nonprofit = Nonprofit.new(nonprofit_params)

    if @nonprofit.save
      message = 'Nonprofit was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @nonprofit, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /nonprofits/1
  def update
    if @nonprofit.update(nonprofit_params)
      redirect_to @nonprofit, notice: 'Nonprofit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /nonprofits/1
  def destroy
    @nonprofit.destroy
    message = "Nonprofit was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to nonprofits_url, notice: message
    end
  end


  private

  def current_user_must_be_nonprofit_owner_user
    set_nonprofit
    unless current_user == @nonprofit.owner_user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_nonprofit
      @nonprofit = Nonprofit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def nonprofit_params
      params.require(:nonprofit).permit(:name, :category, :mission, :contact_name, :contact_email, :contact_phone, :owner_user_id, :status, :notes)
    end
end
