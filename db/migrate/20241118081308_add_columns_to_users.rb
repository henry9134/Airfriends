class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :text
    add_column :users, :location, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
  end
end
