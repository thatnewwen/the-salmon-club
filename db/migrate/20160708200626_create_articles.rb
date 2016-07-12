class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string   :title
      t.text     :content
      t.date     :start_date
      t.date     :end_date
      t.integer  :author_id
      t.integer  :tag_id
      t.integer  :book_id

      t.timestamps
    end
  end
end
