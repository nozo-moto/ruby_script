# Weather Object for OpenWeatherAPI
class Weather
  attr_reader :main, :description, :icon, :date_time, :get_weather

  def initialize(main, description, icon, date_time)
    @main = main
    @description = description
    @icon = icon
    @date_time = date_time
  end
end
