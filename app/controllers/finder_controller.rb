require 'open-uri'
require 'nokogiri'
class FinderController < ApplicationController

	def create
		Product.delete_all
		search_value = params[:id]
		source =  URI.parse URI.encode('http://belchip.by/search/?query=' + search_value)

		page = Nokogiri::HTML(open(source))

		page.css(".cat-item").each do |product|
			Product.create!(
				:name => product.css("h3").text,
				:price => product.css(".denoPrice").text.empty? ?  "цена по запросу" : product.css(".denoPrice").text,
				:image => "http://belchip.by/" + product.css("a")[0]["href"],
				:link => "http://belchip.by/" + product.css("a")[1]["href"],
				) 
		end

		redirect_to '/products/index'
	end


end
