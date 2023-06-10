require 'rails_helper'

RSpec.describe MapService do
  describe 'instance methods' do
    it 'get_map', :vcr do
      map_service = MapService.new
      map_results = map_service.get_map('Denver')

      expect(map_results).to be a Hash
      expect(map_results).to have_key(:results)
      expect(map_results[:results]).to be_an Array 
      expect(map_results[:results]).to have_key(:)
      expect(map_results[:results][:])
    end
  end
end