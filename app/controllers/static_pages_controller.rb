class StaticPagesController < ApplicationController
	require 'flickr'
	require 'JSON'

	def search
	  @flickr = Flickr.new Rails.application.credentials.flickr[:key], Rails.application.credentials.flickr[:secret]
	    @response = @flickr.people.getPhotos(user_id: params[:id]).to_json
	    @response = JSON.parse(@response)
	    @photos = []
	    @response.each do |photo|
	   	  id = photo.dig("id")
		  photo.dig("owner")
		  farm = photo.dig("farm")
		  server = photo.dig("server")
		  secret = photo.dig("secret")
		  @title = photo.dig("title")
          @photo = ["http://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg", @title]
          @photos << @photo
        end
    rescue Flickr::FailedResponse
     flash.now[:danger] = 'Sorry, but the user does not exist.'
     render :search
	end
end
