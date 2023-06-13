require 'rails_helper'  

RSpec.describe 'Activity' do
  describe 'Activity poros' do
    it 'exists' do
      forecast_data = {
        destination: 'chicago, il',
        forecast: {
          summary: 'cloudy',
          temperature: "45.0 F"
        }
      }

      activities_data = {
        activities: [
         { 
            activity: "Learn the basics of drawing",
            type: 'cooking',
            participants: 1,
            price: 0
          },
          { activity: "Learn the basics of painting",
            type: 'relaxation',
            participants: 1,
            price: 0.5
          }
        ]
      }

      activities_by_weather = Activity.new(forecast_data, activities_data)  
# require 'pry'; binding.pry
      expect(activities_by_weather).to be_a Activity
      expect(activities_by_weather.destination).to eq('chicago, il')
      expect(activities_by_weather.forecast).to be_a Hash
      expect(activities_by_weather.forecast).to have_key :summary
      expect(activities_by_weather.forecast[:summary]).to eq('cloudy')  
      expect(activities_by_weather.forecast).to have_key :temperature
      expect(activities_by_weather.forecast[:temperature]).to eq("45.0 F")
      expect(activities_by_weather.activities).to be_an Array
      expect(activities_by_weather.activities.count).to eq(2)
      expect(activities_by_weather.activities.first).to be_a Hash
      expect(activities_by_weather.activities.first).to have_key :activity
      expect(activities_by_weather.activities.first[:activity]).to eq("Learn the basics of drawing")
      expect(activities_by_weather.activities.first).to have_key :type  
      expect(activities_by_weather.activities.first[:type]).to eq('cooking')
      expect(activities_by_weather.activities.first).to have_key :participants
      expect(activities_by_weather.activities.first[:participants]).to eq(1)
      expect(activities_by_weather.activities.first).to have_key :price
      expect(activities_by_weather.activities.first[:price]).to eq(0)
    end
  end
end