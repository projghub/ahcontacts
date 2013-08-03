class AddInstantMessengersToContacts < ActiveRecord::Migration
  def up
    add_column :contacts, :skype, :string
    add_column :contacts, :msn, :string
    add_column :contacts, :aol, :string
    add_column :contacts, :yahoo, :string
    add_column :contacts, :icq, :string

    add_column :contacts, :facebook, :string
    add_column :contacts, :google_plus, :string
    add_column :contacts, :twitter, :string
  end

  def down
    remove_column :contacts, :skype
    remove_column :contacts, :msn
    remove_column :contacts, :aol
    remove_column :contacts, :yahoo
    remove_column :contacts, :icq

    remove_column :contacts, :facebook
    remove_column :contacts, :google_plus
    remove_column :contacts, :twitter
  end
end
