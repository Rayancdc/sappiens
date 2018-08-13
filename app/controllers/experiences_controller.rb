class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!
  attr_accessor :date

  def index
    if params[:query].present?
      @experiences = Experience.global_search(params[:query])
    else
      @experiences = Experience.all
    end

    @markers = @experiences.map do |experience|
      {
        lat: experience.company.latitude,
        lng: experience.company.longitude#,
        # infoWindow: { content: render_to_string(partial: "/experiences/map_box", locals: { experience: experience }) }
      }
    end
  end

  def guidelines
  end

  def show
    @events = @experience.events
  end

  def new
    @experience = Experience.new
  end

  def create
    @company = current_user.company
    @experience = @company.experiences.build(experience_params)
    event_dates = params[:experience][:date].split(', ')
    create_events(event_dates)
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
  def create_events(event_dates)
    event_dates.each do |string_date|
      date = string_date.to_date.in_time_zone
      event = @experience.events.build(date: date)
      event.save
    end
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:career, :price_cents, :description)
  end
end
