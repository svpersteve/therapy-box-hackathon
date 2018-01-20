class PagesController < ApplicationController
  def home
    get_weather
  end

  private

  def get_weather
    get_weather = RestClient.get "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=#{ENV['secret']}"
    @weather = ActiveSupport::JSON.decode(get_weather)
  end
end
