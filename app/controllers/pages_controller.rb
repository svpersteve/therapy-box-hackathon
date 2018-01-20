class PagesController < ApplicationController
  def home
    get_location
    get_weather
    get_news
  end

  private

  def get_weather
    get_weather = RestClient.get "http://api.openweathermap.org/data/2.5/weather?lat=#{@location.latitude}&units=metric&lon=#{@location.longitude}&appid=#{ENV['secret']}"
    @weather = ActiveSupport::JSON.decode(get_weather)
  end

  def get_news
    require 'rss'
    require 'open-uri'
    @rss = RSS::Parser.parse(open("http://feeds.bbci.co.uk/news/rss.xml").read, false).items.first
  end

  def get_location
    @location = request.location
  end
end
