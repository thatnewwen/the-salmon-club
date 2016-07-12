class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
    	t.string   :title
    	t.string   :author
    	t.string   :publication
    	t.string   :url
    	t.integer  :article_id

    	t.timestamps
    end
  end
end
