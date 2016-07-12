class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string   :title
    	t.string   :author
    	t.string   :publisher
    	t.string   :image_url
    	t.integer  :article_id
      
      t.timestamps
    end
  end
end
