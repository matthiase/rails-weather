# frozen_string_literal: true

require 'net/http'
require 'json'

# WeatherService
# Retrieves weather data from the OpenWeather API
# https://openweathermap.org/api/one-call-3
class WeatherService
  BASE_URL = 'https://api.openweathermap.org/data/3.0/onecall'

  def initialize
    @appid = Rails.application.credentials.open_weather[:api_key]
  end

  def get(latitude:, longitude:, units: 'imperial')
    # uri = URI(BASE_URL)
    # params = {
    #  lat: latitude,
    #  lon: longitude,
    #  appid: @appid, units:,
    #  exclude: 'minutely,hourly,daily,alerts'
    # }
    # uri.query = URI.encode_www_form(params)
    # response = Net::HTTP.get_response(uri)

    # foo = JSON.parse(response.body)
    # Rails.logger.debug(JSON.pretty_generate(foo))

    data = '{
      "lat": 38.6661,
      "lon": -121.1852,
      "timezone": "America/Los_Angeles",
      "timezone_offset": -25200,
      "current": {
        "dt": 1698427818,
        "sunrise": 1698416755,
        "sunset": 1698455464,
        "temp": 57.25,
        "feels_like": 55.51,
        "pressure": 1020,
        "humidity": 60,
        "dew_point": 43.52,
        "uvi": 2.03,
        "clouds": 0,
        "visibility": 10000,
        "wind_speed": 1.99,
        "wind_deg": 152,
        "wind_gust": 4,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01d"
          }
        ]
      }
    }'

    Weather.new.from_json(data)
  end
end
