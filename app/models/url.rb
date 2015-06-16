class Url < ActiveRecord::Base
  attr_accessible :url_text, :status, :external_id
  validates :url_text, presence: true
  belongs_to :crawl_request
end
