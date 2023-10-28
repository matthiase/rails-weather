module WeatherHelper
  def format_temperature(temp, units = 'imperial')
    symbol = units == 'imperial' ? 'F' : 'C'
    temperature = number_with_precision(temp, precision: 0)
    "#{temperature}&deg;#{symbol}".html_safe
  end

  def format_temperature_range(high, low, units = 'imperial')
    symbol = units == 'imperial' ? 'F' : 'C'
    high = number_with_precision(high, precision: 0)
    low = number_with_precision(low, precision: 0)
    "#{high} / #{low}&deg;#{symbol}".html_safe
  end

  def format_wind(speed, degrees, units = 'imperial')
    unit = units == 'imperial' ? 'mph' : 'm/s'
    direction = %w[N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW][((degrees % 360) / 22.5).round]
    "#{number_with_precision(speed, precision: 1)} #{unit} #{direction}"
  end

  def weather_icon_url(icon)
    "https://openweathermap.org/img/wn/#{icon}@2x.png"
  end
end
