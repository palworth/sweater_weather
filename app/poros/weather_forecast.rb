class WeatherForecast
  attr_reader :temp, :description
  def initialize(response)
    @temp = response[:current][:temp]
    @description = response[:current][:weather].first[:description]
  end
end
