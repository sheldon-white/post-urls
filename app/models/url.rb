class Url < ActiveRecord::Base
  attr_accessible :url_text, :status, :crawl_request_id, :external_id, :created_at, :updated_at
  belongs_to :crawl_request
end
