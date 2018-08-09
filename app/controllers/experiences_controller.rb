class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!

  def dashboard
  end

  def index
    @experiences = Experience.where.not(latitude: nil, longitude: nil)

    @markers = @experiences.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude#,
        # infoWindow: { content: render_to_string(partial: "/experiences/map_box", locals: { experience: experience }) }
      }
    end
  end

  def show
  end

  def new
    @experience = Experience.new
  end

  def create
    @user = current_user
    @experience = @user.experiences.build(experience_params)
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @experience.update(experience_params)

    redirect_to experience_path(@experience)
  end

  def destroy
    @experience.destroy
    redirect_to experiences_path
  end

  private
  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit()
  end
end
