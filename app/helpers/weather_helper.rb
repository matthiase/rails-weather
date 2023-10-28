module WeatherHelper
  def format_temperature(temp, units = 'imperial')
    symbol = units == 'imperial' ? 'F' : 'C'
    temperature = number_with_precision(temp, precision: 0)
    "#{temperature} &deg; #{symbol}".html_safe
  end

  def format_wind_speed(speed)
    number_with_precision(speed, precision: 1)
  end
end
