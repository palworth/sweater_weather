class GoogleService

  def location_info(location)
    response = conn.get("maps/api/geocode/json") do |f|
       f.params['key'] = ENV['GoogleKey']
       f.params['address'] = location
     end
     json = JSON.parse(response.body, symbolize_names: true)
     location_info = json[:results][0]
  end

  private
  def conn
    Faraday.new(url: 'https://maps.googleapis.com')
  end
end

 #  def opposite_city(start_city_lat, start_city_lng)
 #    response = conn.get("/api/v1/antipodes") do |f|
 #       f.params['lat'] = start_city_lat
 #       f.params['long'] = start_city_lng
 #     end
 #     json = JSON.parse(response.body, symbolize_names: true)
 #   end
 # end

  # def conn
  #   Faraday.new(url: 'http://amypode.herokuapp.com') do |f|
  #     f.headers['api_key'] = ENV['AntipodeKey']
  #   end
  # end
