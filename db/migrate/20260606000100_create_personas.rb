class CreatePersonas < ActiveRecord::Migration[8.1]
  def change
    create_table :personas do |t|
      t.references :case, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.string :occupation
      t.integer :narrative_role, null: false, default: 4

      t.timestamps
    end

    add_index :personas, [ :case_id, :name ]
  end
end
