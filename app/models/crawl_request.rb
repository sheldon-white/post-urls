class CrawlRequest < ActiveRecord::Base
  has_many :urls
  attr_accessible :source 
  accepts_nested_attributes_for :urls
end
