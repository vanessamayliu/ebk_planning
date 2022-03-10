class NonprofitsController < ApplicationController
  before_action :current_user_must_be_nonprofit_owner_user,
                only: %i[edit update destroy]

  before_action :set_nonprofit, only: %i[show edit update destroy]

  def index
    @q = Nonprofit.ransack(params[:q])
    @nonprofits = @q.result(distinct: true).includes(:owner_user,
                                                     :events).page(params[:page]).per(10)
  end

  def show
    @event = Event.new
  end

  def new
    @nonprofit = Nonprofit.new
  end

  def edit; end

  def create
    @nonprofit = Nonprofit.new(nonprofit_params)

    if @nonprofit.save
      message = "Nonprofit was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @nonprofit, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @nonprofit.update(nonprofit_params)
      redirect_to @nonprofit, notice: "Nonprofit was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @nonprofit.destroy
    message = "Nonprofit was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to nonprofits_url, notice: message
    end
  end

  private

  def current_user_must_be_nonprofit_owner_user
    set_nonprofit
    unless current_user == @nonprofit.owner_user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_nonprofit
    @nonprofit = Nonprofit.find(params[:id])
  end

  def nonprofit_params
    params.require(:nonprofit).permit(:name, :category, :mission,
                                      :contact_name, :contact_email, :contact_phone, :owner_user_id, :status, :notes)
  end
end
