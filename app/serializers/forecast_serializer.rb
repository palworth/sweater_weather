class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_feels_like, :current_uvi, :daily_forecast, :city_state, :hourly, :current, :current_humidity
             :current_visibility
end
