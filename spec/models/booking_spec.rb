require 'rails_helper'

RSpec.describe Booking, type: :model do
  
  it { should validate_presence_of(:user_id) }

  it { should validate_presence_of(:event_id) }

  it { should belong_to(:user) }

  it { should belong_to(:event) }
end
