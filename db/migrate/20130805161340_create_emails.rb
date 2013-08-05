class CreateEmails < ActiveRecord::Migration
  def up
    create_table :emails do |t|
      t.string :name
      t.string :subject
	  t.string :from_name, default: "Customer Support"
      t.string :from_email, default: "support@automationhero.com"
      t.text :email_text
      t.text :email_html
      t.boolean :publish, default: true

      t.timestamps
    end
  end

  def down
    drop_table :emails
  end
end
