class FavouritesController < ApplicationController
  before_action :authorize_request

  def add_event_to_favourite
    @favourite = Favourite.new(event_id: params[:event_id], user_id: @current_user.id)
	  if @favourite.save
	    render json: @favourite, status: :created
	  else
	    render error: { error: "unable to create favourite"}, status: 400
	  end
  end

  private

  def favourite_params
    params.permit(:event_id, :user_id)
  end
end
