require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  describe "POST #login" do
    let(:user) { create(:user) }
    
    context "with valid credentials" do
      it "returns a JWT token" do
        post '/auth/login', params: { email: user.email, password: user.password }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
