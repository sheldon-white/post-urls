class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.belongs_to :crawl_request
      t.string :url_text
      t.integer :external_id
      t.string :status

      t.timestamps
    end
  end
end
