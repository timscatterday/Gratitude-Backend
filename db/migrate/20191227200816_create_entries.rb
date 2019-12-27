class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :text, null: false
      t.string :user_id, null: false

      t.timestamps
    end
  end
end
