class AntipodeForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :forecast, :location_name, :search_location
end
