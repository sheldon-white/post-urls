class CreateCrawlRequests < ActiveRecord::Migration
  def change
    create_table :crawl_requests do |t|
      t.string :source
      t.timestamps
    end
  end
end
