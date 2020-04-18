class GoogleService
  def get_lat_lng(location)
    response = conn.get("maps/api/geocode/json") do |f|
       f.params['key'] = ENV['GoogleKey']
       f.params['address'] = location
     end
     json = JSON.parse(response.body, symbolize_names: true)
     lat_lng = json[:results][0][:geometry][:location]
  end

  private
  def conn
    Faraday.new(url: 'https://maps.googleapis.com')
  end
end
