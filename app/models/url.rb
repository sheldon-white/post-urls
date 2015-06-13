class Url < ActiveRecord::Base
  attr_accessible :url_text, :crawl_request_id
  belongs_to :crawl_request
end
