class AddStatusToContacts < ActiveRecord::Migration
  def up
    add_column :contacts, :status_id, :integer
  end

  def down
    remove_column :contacts, :status_id
  end
end
