class CreatePermissionsUsers < ActiveRecord::Migration
  def up
    create_table :permissions_users do |t|
      t.belongs_to :permission, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
    add_index :permissions_users, :permission_id
    add_index :permissions_users, :user_id
  end

  def down
    drop_table :permissions_users
  end
end
