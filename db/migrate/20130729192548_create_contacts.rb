class CreateContacts < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :address
      t.string :address2
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :email
      t.string :phone
      t.string :website
      t.string :fax
      t.string :contact_form_url
      t.datetime :deleted_at, null: true

      t.timestamps
    end
  end

  def down
    drop_table :contacts
  end
end
