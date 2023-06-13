class Activity
  attr_reader :type, 
              :destination, 
              :forecast, 
              :activities

  def initialize(forecast_data, activities_data)
    @type = activities_data[:type]
    @destination = forecast_data[:destination]
    @forecast = forecast_data[:forecast]
    @activities = activities_data[:activities]
  end
end