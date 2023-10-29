class WeatherController < ApplicationController
  def index; end

  def info
    @location = {
      id: 'folsom-ca-us',
      name: 'Folsom, CA',
      latitude: 38.6661318,
      longitude: -121.1851928
    }

    id, name, latitude, longitude = [
      params[:id],
      params[:name],
      params[:lat],
      params[:lng]
    ].compact

    if [latitude, longitude].all?
      @location = {
        id:,
        name:,
        latitude:,
        longitude:
      }
    end

    @cached_at = nil
    @weather = Rails.cache.read(@location[:id])
    if @weather.nil?
      @weather = WeatherService.new.get(latitude: @location[:latitude], longitude: @location[:longitude])
      Rails.cache.write(@location[:id], @weather, expires_in: 30.minutes)
    else
      @cached_at = @weather.fetched_at
    end
  end
end
