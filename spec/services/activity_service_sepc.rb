require 'rails_helper'

RSpec.describe 'ActivyService' do
  describe 'happy path' do
    it 'returns activity data', :vcr do
      activity_service = ActivityService.new
      activities = activity_service.get_activity('recreational')

      expect(activities).to be_a Hash
      expect(activities).to have_key :activity
      expect(activities[:activity]).to be_a String

      expect(activities).to have_key :type
      expect(activities[:type]).to be_a String

      expect(activities).to have_key :participants
      expect(activities[:participants]).to be_an Integer

      expect(activities).to have_key :price
      expect(activities[:price]).to be_an Integer

      expect(activities).to have_key :link
      expect(activities[:link]).to be_a String

      expect(activities).to have_key :key
      expect(activities[:key]).to be_a String

      expect(activities).to have_key :accessibility
      expect(activities[:accessibility]).to be_a Float
    end
  end
end