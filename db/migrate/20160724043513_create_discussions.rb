class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
    	t.integer  :article_id
    	t.date     :start_date
    	t.string   :description

    	t.timestamps
    end
  end
end
