class AddPromocodeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :promocode, :string
  end
end
