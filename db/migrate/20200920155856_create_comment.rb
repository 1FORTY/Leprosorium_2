class CreateComment < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :name
      t.text :content

      t.timestamps
    end
  end
end
