require 'rails_helper'

RSpec.describe "Events", type: :request do

  before :each do
    @user = FactoryBot.create(:user, name: "Aman", username: "aman", role: "admin", email: "aman@gmail.com", password: "password", password_confirmation: "password")
    @token = JsonWebToken.encode(user_id: @user.id)
    allow(controller).to receive(:authorize_request)
  end

  describe 'POST #create' do
    it 'creates a new event' do
      event_params = {
        title: "Music Tour",
        date: "2023-09-11",
        location: "Indore",
        ticket_availability: 20,
        price: 200,
        category: "music",
        user_id: @user.id
      }

      post '/events', params: event_params, headers: { Authorization: @token }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to include('id', 'title', 'date', 'location', 'ticket_availability', 'price', 'category', 'user_id')
    end
  end

  describe 'PUT #update' do
    it 'updates an event by an admin user' do
      event = FactoryBot.create(:event, title: "Music Tour",
      date: "2023-09-11",
      location: "Indore",
      ticket_availability: 20,
      price: 200,
      category: "music",
      user_id: @user.id)

      updated_params = {
        title: "Updated Concert",
        date: "2023-09-15",
        location: "New Venue",
        ticket_availability: 25,
        price: 250,
        category: "music",
        user_id: @user.id
      }

      put "/events/#{event.id}", params: updated_params, headers: { Authorization: @token }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to include('id', 'title', 'date', 'location', 'ticket_availability', 'price', 'category', 'user_id')
    end
  end

  describe 'GET #search' do
    it 'returns events matching the search criteria' do
      get '/search', params: { search: "music" }, headers: { Authorization: @token }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #search_by_category' do
    it 'returns events matching the specified category' do
      get '/search_by_category', params: { category: "music" }, headers: { Authorization: @token }
      expect(response).to have_http_status(:ok)
    end
  end 

  describe 'GET #search_by_location' do
    it 'returns events matching the specified location' do
      get '/search_by_category', params: { location: "music" }, headers: { Authorization: @token }
      expect(response).to have_http_status(:ok)
    end
  end 
end
