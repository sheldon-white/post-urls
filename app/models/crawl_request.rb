class CrawlRequest < ActiveRecord::Base
  has_many :urls
  attr_accessible :source, :urls_attributes
  accepts_nested_attributes_for :urls
end
