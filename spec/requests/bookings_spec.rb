require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  before :each do
    @user = FactoryBot.create(:user, name: "Aman", username: "aman", role: "fan", email: "aman@gmail.com", password: "password", password_confirmation: "password")
    @event = FactoryBot.create(:event, title: "Music Tour", date: "2023-09-11", location: "Indore", ticket_availability: 20, price: 200, category: "music", user_id: @user.id)
    @token = JsonWebToken.encode(user_id: @user.id)
    allow(controller).to receive(:authorize_request)
  end

  describe 'POST #create' do
    it 'creates a new booking' do
      booking_params = {
        event_id: @event.id,
        user_id: @user.id
      }

      post '/bookings', params: booking_params, headers: { Authorization: @token }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to include('id', 'event_id', 'user_id')
    end
  end
end
