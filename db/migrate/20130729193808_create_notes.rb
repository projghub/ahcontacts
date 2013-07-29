class CreateNotes < ActiveRecord::Migration
  def up
    create_table :notes do |t|
      t.belongs_to :user, null: true
      t.integer :noteable_id, null: false
      t.string :noteable_type, null: false
      t.string :namespace, null: false
      t.text :description
      t.boolean :auto, default: true

      t.timestamps
    end
    add_index :notes, :user_id
  end

  def down
    drop_table :notes
  end
end
