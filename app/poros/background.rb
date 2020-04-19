class Background
  attr_reader :photo_description, :photo_url, :id
  def initialize(service_response)
    @id = nil
    @photo_url = service_response[:urls][:full] #URL of photo
    @photo_description = service_response[:alt_description] # photo summary
  end
end
