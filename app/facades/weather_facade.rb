# frozen_string_literal: true

class WeatherFacade
  def initialize(map)
    @map = map
    @lat = get_map[:latLng][:lat]
    @lon = get_map[:latLng][:lng]
  end

  def weather
    # require 'pry'; binding.pry
    @weather ||= Weather.new(all_weather_data)
  end

  private

  def map_service
    @map_service ||= MapService.new
  end

  def weather_service
    @weather_service ||= WeatherService.new
  end

  def get_map
    @get_map ||= map_service.get_map(@map)[:results][0][:locations][0]
  end

  def get_weather
    @get_weather ||= weather_service.get_weather(@lat, @lon)
  end

  def current_weather
    {
      last_updated: get_weather[:current][:last_updated],
      temp_f: get_weather[:current][:temp_f],
      condition: get_weather[:current][:condition][:text],
      icon: get_weather[:current][:condition][:icon],
      humidity: get_weather[:current][:humidity],
      feelslike_f: get_weather[:current][:feelslike_f],
      vis_miles: get_weather[:current][:vis_miles],
      uvi: get_weather[:current][:uv]
    }
  end

  def daily_weather
    get_weather[:forecast][:forecastday][1..5].map do |daily|
      {
        date: daily[:date],
        sunrise: daily[:astro][:sunrise],
        sunset: daily[:astro][:sunset],
        max_temp: daily[:day][:maxtemp_f],
        min_temp: daily[:day][:mintemp_f],
        condition: daily[:day][:condition][:text],
        icon: daily[:day][:condition][:icon]
      }
    end
  end

  def hourly_weather
    get_weather[:forecast][:forecastday][0][:hour].map do |hourly|
      {
        time: hourly[:time],
        temp: hourly[:temp_f],
        condition: hourly[:condition][:text],
        icon: hourly[:condition][:icon]

      }
    end
  end

  def books(location, quantity)
    book_service = BookService.new
    book_results = book_service.get_books(location, quantity)

    BooksFacade.new(book_results).books
  end


  def all_weather_data
    {
      hourly_weather: hourly_weather,
      daily_weather: daily_weather,
      current_weather: current_weather,
      books: books(@map, 5)
    }
  end
end
