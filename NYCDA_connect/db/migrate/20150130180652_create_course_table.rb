class CreateCourseTable < ActiveRecord::Migration
  def change
create_table :courses do |t|
  		t.string :ctitle
  		t.text :pcontent
  	end
  end
end
