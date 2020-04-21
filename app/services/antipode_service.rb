class AntipodeService

  def opposite_city(start_city_lat, start_city_lng)
    response = conn.get("/api/v1/antipodes") do |f|
      f.params['lat'] = start_city_lat
      f.params['long'] = start_city_lng
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:data][:attributes]
  end

  private
  def conn
    Faraday.new(url: 'http://amypode.herokuapp.com') do |f|
      f.headers['api_key'] = ENV['AntipodeKey']
    end
  end
end
