class PagesController < ApplicationController


	def create
		begin
			@page = Page.new(page_params)
			@page.save!
 			@page.set_content
  			
  			response = {"status" => "SUCCESS"}
		rescue Exception => e
			logger.debug "Error in creating record for url: #{params[:url]}"
			logger.debug e
			response = {"status" => "FAILURE"}
		end

		render :json => response
	end

	def index
		begin
			@pages = Page.includes(:contents)
			@content = {}
			@pages.each do |page|
				@content[page.url] = page.contents
			end
			response = {"pages" => @pages, "content" => @content, "status" => "SUCCESS"}
		rescue Exception => e
			logger.debug "Error in fetch pages"
			logger.debug e

			response = {"status" => "FAILURE"}
		end

		render :json => response
	end

	def show
		@page = Page.find[]
	end
 
	private
	  def page_params
	    params.permit(:url)
	  end

end
