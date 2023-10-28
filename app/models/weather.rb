require 'ostruct'

# Transforms the data from the OpenWeather API into a format that is easier
# to work with
class Weather
  include ActiveModel::Model
  include ActiveModel::Serializers::JSON

  attr_accessor :latitude, :longitude, :timezone, :timezone_offset, :current

  def attributes
    instance_values
  end

  def attributes=(hash)
    hash = hash.with_indifferent_access
    self.latitude = hash[:lat]
    self.longitude = hash[:lon]
    self.timezone = hash[:timezone]
    self.timezone_offset = hash[:timezone_offset]

    current = hash.fetch(:current, {})
    self.current = OpenStruct.new
    self.current.localtime = Time.at(current[:dt]).in_time_zone(timezone)
    self.current.sunrise = Time.at(current[:sunrise]).in_time_zone(timezone)
    self.current.sunset = Time.at(current[:sunset]).in_time_zone(timezone)
    self.current.temperature = current[:temp]
    self.current.feels_like = current[:feels_like]
    self.current.pressure = current[:pressure]
    self.current.humidity = current[:humidity]
    self.current.dew_point = current[:dew_point]
    self.current.uvi = current[:uvi]
    self.current.clouds = current[:clouds]
    self.current.visibility = current[:visibility]
    self.current.wind_speed = current[:wind_speed]
    self.current.wind_deg = current[:wind_deg]
    self.current.wind_gust = current[:wind_gust]
    self.current.weather = current[:weather]
    self.current.title = current[:weather].first[:main]
    self.current.description = current[:weather].first[:description]
    self.current.icon = current[:weather].first[:icon]
  end
end
