require 'rails_helper'

RSpec.describe MapService do
  describe 'connection exists' do
    it 'it can connect and get map', :vcr do
      map_service = MapService.new
      map_results = map_service.get_map('Denver, CO')

      expect(map_results).to be_a Hash
      expect(map_results).to have_key :results
      expect(map_results[:results][0][:locations][0][:latLng]).to have_key :lat
      expect(map_results[:results][0][:locations][0][:latLng]).to have_key :lng 
      expect(map_results[:results][0][:locations][0][:latLng][:lat]).to be_a Float
      expect(map_results[:results][0][:locations][0][:latLng][:lng]).to be_a Float
      
    end
  end
end