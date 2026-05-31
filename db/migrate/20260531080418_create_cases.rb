class CreateCases < ActiveRecord::Migration[8.1]
  def change
    create_table :cases do |t|
      t.string :name
      t.string :intro
      t.references :created_by, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
  end
end
