class Page < ApplicationRecord
  	validates :url, presence: true
	has_many :contents
	def set_content
		begin
			doc = Nokogiri::HTML(open(self.url))

			relevant_content = ['a', 'h1', 'h2', 'h3']

			relevant_content.each do |content_type|
				doc.css(content_type).each do |data|
		      		self.contents.create(content_type: content_type, data: data.content)
		    	end
		    end
		rescue Exception => e
		  logger.debug "Couldn't read #{ self.url }"
		  logger.debug e
		  self.destroy
		  exit
		end
	end

	def as_json options={}
	  {
	  	id: id,
	    url: url
	  }
	end
end
