require 'net/http'
require 'json'
require_relative './weather'

# Constants for OpenWeatherMap
module OpenWeatherMap
  KEY = '3e69a122994192dbd9ef5e624d19b162'.freeze
  BASE_URI = 'http://api.openweathermap.org/data/2.5/forecast'.freeze
end

class WeatherAPI
  def initialize(key, uri)
    @key = key
    @bash_uri = uri
  end

  def weather(place)
    uri = URI.parse(@bash_uri + query(place))
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
    "?q=#{place},jp&APPID=#{@key}"
  end
end
