class ActivityFacade
  def initialize(type)
    @type = type
  end

  def get_activity_info
    Activity.new(@type, forecast, activities)
  end
  
  def activities
    {
      activity: activities[:activity],
      type: activities[:type],
      participants: activities[:participants],
      price: activities[:price]
    }
  end
  
  def forecast
    weather_facade.activity_weather
  end

  private

  def activity_service
    @activity_service ||= ActivityService.new
  end

  def activities
    require 'pry'; binding.pry
    @activities ||= activity_service.get_activity(@type)
  end

  def weather_facade
    @weather_facade ||= WeatherFacade.new(@locations)
  end
end