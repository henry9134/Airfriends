class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
    
      t.references :reviewer, foreign_key: { to_table: :users }
      t.references :friend, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
