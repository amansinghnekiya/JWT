require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:user) }

  it { should have_many(:bookings) }

  it { should have_many(:favourites) }

  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(30) }

  it { should validate_presence_of(:date) }

  it { should validate_presence_of(:location) }
  it { should validate_length_of(:location).is_at_most(40) }

  it { should validate_presence_of(:ticket_availability) }
  it { should validate_numericality_of(:ticket_availability).is_greater_than_or_equal_to(0) }

  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(1) }

  it { should define_enum_for(:category).with_values(music: 0, standup: 1, sport: 2) }
end
