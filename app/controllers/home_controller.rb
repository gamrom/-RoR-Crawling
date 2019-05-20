require 'nokogiri'
require 'open-uri'
class HomeController < ApplicationController
  def index
    @rank = []
    doc = Nokogiri::HTML(open("https://www.naver.com"))

    doc.css('.ah_roll div ul a').each do |element|
      @rank << {
        number: element.css("span.ah_r").text,
        content: element.css("span.ah_k").text
      }
    end
  end
end
#div.ah_roll.PM_CL_realtimeKeyword_rolling_base > div > ul > li:nth-child(1) > a > span.ah_r
