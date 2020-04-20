class AntipodeForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :forecast, :temperature, :location_name, :search_location
end
