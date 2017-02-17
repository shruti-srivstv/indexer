class Content < ApplicationRecord
  belongs_to :page

  	def as_json options={}
	  {
	    content_type: content_type,
	    data: data,
	    page_id: page_id
	  }
	end
end
