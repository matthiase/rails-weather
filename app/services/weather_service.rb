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

  def get(latitude:, longitude:, units: 'imperial', exclude: 'minutely,hourly')
    uri = URI(BASE_URL)
    params = { lat: latitude, lon: longitude, appid: @appid, units:, exclude: }
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body, symbolize_names: true)
  end
end
