class NonprofitsController < ApplicationController
  before_action :set_nonprofit, only: [:show, :edit, :update, :destroy]

  # GET /nonprofits
  def index
    @nonprofits = Nonprofit.all
  end

  # GET /nonprofits/1
  def show
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
      redirect_to @nonprofit, notice: 'Nonprofit was successfully created.'
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
    # Use callbacks to share common setup or constraints between actions.
    def set_nonprofit
      @nonprofit = Nonprofit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def nonprofit_params
      params.require(:nonprofit).permit(:name, :category, :mission, :contact_name, :contact_email, :contact_phone, :owner_user_id, :status, :notes)
    end
end
