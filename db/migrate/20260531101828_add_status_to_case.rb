class AddStatusToCase < ActiveRecord::Migration[8.1]
  def change
    add_column :cases, :status, :integer
  end
end
