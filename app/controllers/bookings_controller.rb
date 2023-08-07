class BookingsController < ApplicationController
    before_action :authorize_request

    def create
      @booking = Booking.new(event_id: params[:event_id], user_id: @current_user.id)
      @event = Event.find(params[:event_id])
      if @event.ticket_availability > 0
        if @booking.save
          @event.ticket_availability -= 1
          @event.save
          render json: @booking, status: :created
        else
          render json: { errors: @booking.errors.full_messages },
                 status: :unprocessable_entity
        end
      else
        render json: { errors: "Sold Out" }
      end
    end

    private

    def booking_params
      params.permit(:event_id, :user_id)
    end

end
