class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.integer  :tag_id
    	t.integer  :article_id

    	t.timestamps
    end
  end
end
