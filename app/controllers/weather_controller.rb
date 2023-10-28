class WeatherController < ApplicationController
  def index
    @location = {
      name: 'Folsom, CA, USA',
      latitude: 38.6661318,
      longitude: -121.1851928
    }
    @weather = WeatherService.new.get(latitude: @location[:latitude], longitude: @location[:longitude])
    # weather_data = {
    #  lat: 37.8267,
    #  lon: -122.4233,
    #  timezone: 'America/Los_Angeles',
    #  timezone_offset: -25_200,
    #  current: {
    #    dt: 1_698_399_776,
    #    sunrise: 1_698_416_755,
    #    sunset: 1_698_455_464,
    #    temp: 50.5,
    #    feels_like: 48.92,
    #    pressure: 1019,
    #    humidity: 78,
    #    dew_point: 43.92,
    #    uvi: 0,
    #    clouds: 43,
    #    visibility: 10_000,
    #    wind_speed: 8.01,
    #    wind_deg: 265,
    #    wind_gust: 15.01,
    #    weather: [{ id: 802, main: 'Clouds', description: 'scattered clouds', icon: '03n' }]
    #  }
    # }

    Rails.logger.debug(@weather.current.inspect)

    # Convert wind direction from degrees to a cardinal direction
    # https://windy.app/blog/what-is-wind-direction.html
    #@current_conditions[:wind_direction] =
    #  case @current_conditions[:wind_deg]
    #  when 0..11.25 then 'N'
    #  when 11.26..33.75 then 'NNE'
    #  when 33.76..56.25 then 'NE'
    #  when 56.26..78.75 then 'ENE'
    #  when 78.76..101.25 then 'E'
    #  when 101.26..123.75 then 'ESE'
    #  when 123.76..146.25 then 'SE'
    #  when 146.26..168.75 then 'SSE'
    #  when 168.76..191.25 then 'S'
    #  when 191.26..213.75 then 'SSW'
    #  when 213.76..236.25 then 'SW'
    #  when 236.26..258.75 then 'WSW'
    #  when 258.76..281.25 then 'W'
    #  when 281.26..303.75 then 'WNW'
    #  when 303.76..326.25 then 'NW'
    #  when 326.26..348.75 then 'NNW'
    #  when 348.76..360 then 'N'
    #  else ''
    #  end

    #@localtime = Time.at(@weather.current[:dt]).in_time_zone(@weather.timezone)
    #@sunrise = @weather.sunrise # Time.at(@current_conditions[:sunrise]).in_time_zone(@weather.timezone)
    #@sunset = @weather.sunset # Time.at(@current_conditions[:sunset]).in_time_zone(@weather.timezone)
  end
end
