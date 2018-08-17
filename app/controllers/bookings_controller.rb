class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @event = Event.find(params[:event_id])
    @booking = Booking.new
  end

	def create
  	@booking = Booking.new
  	@booking.user = current_user
  	@booking.event = Event.find(params[:event_id])
    transaction = PagarMe::Transaction.find_by_id(params[:token])
    transaction.capture({:amount => transaction.authorized_amount})
    @booking.status = transaction.status
  	if @booking.save
      BookingMailer.creation_confirmation_company(@booking).deliver_now
      BookingMailer.creation_confirmation_user(@booking).deliver_now

      respond_to do |format|
  		  format.html { redirect_to booking_path(@booking) }
        format.json { render json: { booking_id: @booking.id , payment_status: transaction.status }, status: 200 }
      end

  	else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: { errors: @booking.errors.full_messages, payment_status: transaction.status }, status: 422 }
      end

  	end
	end

	private

	# def booking_params
	# 	params.require(:booking).permit()

	# end

end

