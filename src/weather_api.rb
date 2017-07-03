require 'net/http'
require 'json'
require_relative './open_weather_map'
require_relative './weather'

# Access for OpenWeatherMap API
class WeatherAPI
  def initialize(key)
    @key = key
  end

  def weather(place)
    uri = URI.parse(OpenWeatherMap::BASE_URI + query(place))
    json = Net::HTTP.get(uri)
    hash = JSON.parse(json, symbolize_names: true)
    now = hash[:list][0]
    now[:weather].map do |h|
      Weather.new(
        h[:main], h[:description], h[:icon], now[:dt_txt]
      )
    end

  end

  private

  def query(place)
    "?q=#{place},jp&APPID=#{OpenWeatherMap::KEY}"
  end
end