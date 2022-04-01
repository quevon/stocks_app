class AddNullFalseApproved < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :approved, :boolean, null: false
  end
end
