  class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.creation_confirmation.subject
  #
  def creation_confirmation_user(booking)
    @booking = booking
    @user = @booking.user

    mail(
      to:       @user.email,
      subject:  "You have booked a #{@booking.event.experience.career} experience!"
    )
  end

  def creation_confirmation_company(booking)
    @booking = booking
    @company = @booking.event.experience.company

    mail(
      to:       @company.user.email,
      subject:  "A user have booked your #{@booking.event.experience.career} event!"
    )
  end
end
