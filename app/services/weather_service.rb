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
    #uri = URI(BASE_URL)
    #params = {
    #  lat: latitude,
    #  lon: longitude,
    #  appid: @appid, units:,
    #  exclude: 'minutely,hourly,alerts'
    #}
    #uri.query = URI.encode_www_form(params)
    #response = Net::HTTP.get_response(uri)

    #foo = JSON.parse(response.body)
    #Rails.logger.debug(JSON.pretty_generate(foo))

    data = '{
      "lat": 38.6661,
      "lon": -121.1852,
      "timezone": "America/Los_Angeles",
      "timezone_offset": -25200,
      "current": {
        "dt": 1698501675,
        "sunrise": 1698503220,
        "sunset": 1698541791,
        "temp": 43.07,
        "feels_like": 41.38,
        "pressure": 1020,
        "humidity": 82,
        "dew_point": 37.96,
        "uvi": 0,
        "clouds": 0,
        "visibility": 10000,
        "wind_speed": 3.44,
        "wind_deg": 340,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01n"
          }
        ]
      },
      "daily": [
        {
          "dt": 1698519600,
          "sunrise": 1698503220,
          "sunset": 1698541791,
          "moonrise": 1698541620,
          "moonset": 1698502500,
          "moon_phase": 0.5,
          "summary": "There will be clear sky today",
          "temp": {
            "day": 61.65,
            "min": 43.07,
            "max": 72.21,
            "night": 52.29,
            "eve": 68.34,
            "morn": 43.97
          },
          "feels_like": {
            "day": 58.59,
            "night": 48.15,
            "eve": 65.3,
            "morn": 42.78
          },
          "pressure": 1020,
          "humidity": 23,
          "dew_point": 23.2,
          "wind_speed": 14.81,
          "wind_deg": 330,
          "wind_gust": 27.74,
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
            }
          ],
          "clouds": 0,
          "pop": 0,
          "uvi": 3.42
        },
        {
          "dt": 1698606000,
          "sunrise": 1698589684,
          "sunset": 1698628119,
          "moonrise": 1698629940,
          "moonset": 1698593340,
          "moon_phase": 0.53,
          "summary": "There will be clear sky today",
          "temp": {
            "day": 63.63,
            "min": 44.91,
            "max": 72.21,
            "night": 53.89,
            "eve": 64,
            "morn": 45.25
          },
          "feels_like": {
            "day": 60.26,
            "night": 49.87,
            "eve": 60.62,
            "morn": 43.39
          },
          "pressure": 1022,
          "humidity": 12,
          "dew_point": 10.24,
          "wind_speed": 6.22,
          "wind_deg": 359,
          "wind_gust": 12.33,
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
            }
          ],
          "clouds": 0,
          "pop": 0,
          "uvi": 3.54
        },
        {
          "dt": 1698692400,
          "sunrise": 1698676149,
          "sunset": 1698714449,
          "moonrise": 1698718620,
          "moonset": 1698684120,
          "moon_phase": 0.57,
          "summary": "Expect a day of partly cloudy with clear spells",
          "temp": {
            "day": 65.23,
            "min": 47.5,
            "max": 71.6,
            "night": 55.26,
            "eve": 63.79,
            "morn": 48.52
          },
          "feels_like": {
            "day": 61.97,
            "night": 51.33,
            "eve": 60.39,
            "morn": 47.98
          },
          "pressure": 1022,
          "humidity": 11,
          "dew_point": 9.43,
          "wind_speed": 4.18,
          "wind_deg": 273,
          "wind_gust": 4.25,
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
            }
          ],
          "clouds": 4,
          "pop": 0,
          "uvi": 3.44
        },
        {
          "dt": 1698778800,
          "sunrise": 1698762614,
          "sunset": 1698800780,
          "moonrise": 1698807720,
          "moonset": 1698774720,
          "moon_phase": 0.6,
          "summary": "There will be clear sky until morning, then partly cloudy",
          "temp": {
            "day": 63.28,
            "min": 51.1,
            "max": 71.35,
            "night": 57.11,
            "eve": 70.72,
            "morn": 51.44
          },
          "feels_like": {
            "day": 60.03,
            "night": 53.42,
            "eve": 68.05,
            "morn": 47.26
          },
          "pressure": 1021,
          "humidity": 15,
          "dew_point": 14.05,
          "wind_speed": 4.05,
          "wind_deg": 76,
          "wind_gust": 3.58,
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": 100,
          "pop": 0,
          "uvi": 3.11
        },
        {
          "dt": 1698865200,
          "sunrise": 1698849079,
          "sunset": 1698887112,
          "moonrise": 1698897240,
          "moonset": 1698864960,
          "moon_phase": 0.64,
          "summary": "Expect a day of partly cloudy with clear spells",
          "temp": {
            "day": 65.82,
            "min": 52.68,
            "max": 75.29,
            "night": 61.05,
            "eve": 73.71,
            "morn": 53.94
          },
          "feels_like": {
            "day": 62.76,
            "night": 57.61,
            "eve": 71.24,
            "morn": 50.02
          },
          "pressure": 1019,
          "humidity": 14,
          "dew_point": 14.4,
          "wind_speed": 5.26,
          "wind_deg": 96,
          "wind_gust": 5.64,
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
            }
          ],
          "clouds": 6,
          "pop": 0,
          "uvi": 4
        },
        {
          "dt": 1698951600,
          "sunrise": 1698935545,
          "sunset": 1698973445,
          "moonrise": 1698987120,
          "moonset": 1698954660,
          "moon_phase": 0.67,
          "summary": "There will be partly cloudy today",
          "temp": {
            "day": 70.02,
            "min": 57.56,
            "max": 75.97,
            "night": 64.76,
            "eve": 74.14,
            "morn": 58.12
          },
          "feels_like": {
            "day": 67.28,
            "night": 62.53,
            "eve": 72.57,
            "morn": 54.48
          },
          "pressure": 1020,
          "humidity": 12,
          "dew_point": 14.31,
          "wind_speed": 4.09,
          "wind_deg": 106,
          "wind_gust": 5.37,
          "weather": [
            {
              "id": 803,
              "main": "Clouds",
              "description": "broken clouds",
              "icon": "04d"
            }
          ],
          "clouds": 62,
          "pop": 0,
          "uvi": 4
        },
        {
          "dt": 1699038000,
          "sunrise": 1699022011,
          "sunset": 1699059780,
          "moonrise": 1699077180,
          "moonset": 1699043760,
          "moon_phase": 0.7,
          "summary": "There will be partly cloudy today",
          "temp": {
            "day": 71.55,
            "min": 59.74,
            "max": 79,
            "night": 67.69,
            "eve": 78.87,
            "morn": 60.46
          },
          "feels_like": {
            "day": 69.62,
            "night": 66.04,
            "eve": 78.87,
            "morn": 57.79
          },
          "pressure": 1019,
          "humidity": 26,
          "dew_point": 34.63,
          "wind_speed": 4.79,
          "wind_deg": 279,
          "wind_gust": 6.51,
          "weather": [
            {
              "id": 803,
              "main": "Clouds",
              "description": "broken clouds",
              "icon": "04d"
            }
          ],
          "clouds": 64,
          "pop": 0,
          "uvi": 4
        },
        {
          "dt": 1699124400,
          "sunrise": 1699108477,
          "sunset": 1699146116,
          "moonrise": 1699167360,
          "moonset": 1699132380,
          "moon_phase": 0.73,
          "summary": "There will be partly cloudy today",
          "temp": {
            "day": 72.3,
            "min": 63.84,
            "max": 78.12,
            "night": 67.39,
            "eve": 76.59,
            "morn": 64.4
          },
          "feels_like": {
            "day": 70.97,
            "night": 66.79,
            "eve": 75.63,
            "morn": 62.74
          },
          "pressure": 1016,
          "humidity": 37,
          "dew_point": 44.46,
          "wind_speed": 6.82,
          "wind_deg": 155,
          "wind_gust": 15.01,
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": 99,
          "pop": 0,
          "uvi": 4
        }
      ]
    }'

    Weather.new.from_json(data)
  end
end
