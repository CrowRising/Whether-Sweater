require 'rails_helper'

RSpec.describe Weather do
  describe 'weather poros' do
    it 'exists and has attributes' do
      forcast_data = {
        current_weather: {
          last_updated: "2023-06-10 19:45",
          temp_f: 62.2,
          condition: {
              text: "Moderate or heavy rain with thunder",
              icon: "//cdn.weatherapi.com/weather/64x64/day/389.png"
          },
          humidity: 55,
          feelslike_f: 62.2,
          vis_miles: 9.0,
          uvi: 4.0
        },
        daily_weather: [
          {
            date: "2023-06-10",
            sunrise: "5:32",
            sunset: "20:27" ,
            max_temp: 75.9,
            min_temp: 54.5,
            icon: "//cdn.weatherapi.com/weather/64x64/day/389.png"
          },
          {
            date: "2023-06-10",
            sunrise: "5:32",
            sunset: "20:27" ,
            max_temp: 75.9,
            min_temp: 54.5,
            icon: "//cdn.weatherapi.com/weather/64x64/day/389.png"
          }
        ],
        hourly_weather: [
          {
            time: "2023-06-10 00:00",
            temp: 57.4,
            condition: "Clear",
            icon:"//cdn.weatherapi.com/weather/64x64/night/113.png"
          }
        ]
      }

    end
  end
end