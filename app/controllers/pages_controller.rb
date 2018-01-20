class PagesController < ApplicationController
  def home
    get_weather
    get_news
  end

  private

  def get_weather
    get_weather = RestClient.get "http://api.openweathermap.org/data/2.5/weather?lat=35&units=metric&lon=139&appid=#{ENV['secret']}"
    @weather = ActiveSupport::JSON.decode(get_weather)
  end

  def get_news
    require 'rss'
    require 'open-uri'
    @rss = RSS::Parser.parse(open("http://feeds.bbci.co.uk/news/rss.xml").read, false).items.first
  end
end
