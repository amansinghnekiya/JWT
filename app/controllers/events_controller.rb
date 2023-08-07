class EventsController < ApplicationController
  before_action :authorize_request
  
  def create
    @event = Event.new(event_params)
    user = User.find_by_id!(params[:user_id])

    if user.role == "admin"
      if @event.save
        render json: @event, status: :created
      else
        render json: { errors: @event.errors.full_messages },
               status: :unprocessable_entity
      end
    else
      render json: { errors: "User must be admin" }
    end
  end

  def update
    @event = Event.find(params[:id])
    user = User.find_by_id!(params[:user_id])
    if user.role == "admin"
      if @event.update(event_params)
        render json: @event, status: :ok
      else
        render json: { errors: @event.errors.full_messages },
               status: :unprocessable_entity
      end
    else
        render json: { errors: "User must be admin" }
    end 
  end

  def search_by_event
    @events = Event.where("title LIKE ?", "%#{params[:title]}%")
    if @events.any?
      render json: @events, status: :ok
    else
      render json: { errors: "Event not found" }
    end
  end

  def search_by_category
    @categories = Event.where('category LIKE ?', "%#{params[:category]}%")
    if @categories.any?
      render json: @categories, status: :ok
    else
      render json: { errors: "There is no such category" }
    end
  end

  def search_by_location
    @locations = Event.where('location LIKE ?', "%#{params[:location]}%")
    if @locations.any?
      render json: @locations, status: :ok
    else
      render json: { errors: "No enents at this location" }
    end
  end

  

  private

  def event_params
    params.permit(:title, :date, :location, :ticket_availability, :price, :category, :user_id)
  end

end
