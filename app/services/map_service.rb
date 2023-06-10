class MapService

  def get_map(location)
    get_url("/geocoding/v1/address?location=#{location}")
  end

  private

  def conn 
    Faraday.new(url: "https://www.mapquestapi.com") do
      faraday.params['key'] = ENV['MAP_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end