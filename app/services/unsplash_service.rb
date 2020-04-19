class UnsplashService

  def find_picture(location)
    response = conn.get("/search/photos") do |f|
      f.params['client_id'] = ENV['UnsplashKey']
      f.params['query'] = location
      f.params['orientation'] = "landscape"
     end
     json = JSON.parse(response.body, symbolize_names: true)
     picture_info = json[:results].first
  end

  private
  def conn
    Faraday.new(url: 'https://api.unsplash.com')
  end
end
