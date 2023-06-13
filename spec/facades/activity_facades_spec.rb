require 'rails_helper'

RSpec.describe 'ActivityFacade' do
  describe 'ActivityFacade methods', :vcr do
    let(:activity_facade) { ActivityFacade.new('recreational').get_activity_info }
    it 'returns an activity' do
  
      expect(activity_facade).to be_a Hash
      expect(activity_facade.activity).to be_an Array
    end
  end
end