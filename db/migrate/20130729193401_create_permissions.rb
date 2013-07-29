class CreatePermissions < ActiveRecord::Migration
  def up
    create_table :permissions do |t|
      t.string :namespace, null: false
      t.string :controller, default: ""
      t.string :action, default: ""

      t.timestamps
    end
  end

  def down
    drop_table :permissions
  end
end
