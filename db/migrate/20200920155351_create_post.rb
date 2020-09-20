class CreatePost < ActiveRecord::Migration[6.0]
  def change
  	create_table :posts do |t|
  		t.text :name
  		t.text :content

  		t.timestamps
  	end
  end
end
