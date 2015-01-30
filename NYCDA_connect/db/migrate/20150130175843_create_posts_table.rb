class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :ptitle
  		t.text :pcontent
  		t.integer :user_id
  		t.integer :post_id
  	end
  end
end
