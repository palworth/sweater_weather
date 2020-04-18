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
