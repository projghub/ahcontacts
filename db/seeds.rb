def create_permissions
  Admin::Permission.create!(namespace: "admin", controller: "application")
  Admin::Permission.create!(namespace: "admin", controller: "full")
  Admin::Permission.create!(namespace: "advertiser", controller: "application")
  Admin::Permission.create!(namespace: "advertiser", controller: "full")
end

def create_admin_user
  user = User.create!(first_name: 'Admin', last_name: 'User', email: 'admin@crm.com', password: 'password')

  pu = user.permissions_users.new
  pu.permission_id = 1
  pu.save

  pu = user.permissions_users.new
  pu.permission_id = 2
  pu.save
end

create_permissions
create_admin_user

if Rails.env.development?
  def create_fake_advertiser_users
    user = User.create!(first_name: 'Advertiser', last_name: 'User', email: 'advertiser@crm.com', password: 'password')
    user.save!

    pu = user.permissions_users.new
    pu.permission_id = 3
    pu.save!

    pu = user.permissions_users.new
    pu.permission_id = 4
    pu.save!
  end

  def create_fake_statuses
    Status.create!(name: "Sent first email", placement: 1)
    Status.create!(name: "Created account", placement: 2)
    Status.create!(name: "Sending Traffic", placement: 3)
  end

  def create_fake_contacts
    Contact.create!(first_name: "First 1", last_name: "Last 1", tag_list: "Mom")
    Contact.create!(first_name: "First 2", last_name: "Last 2", tag_list: "MLM")
    Contact.create!(first_name: "First 3", last_name: "Last 3", tag_list: "MLM")
  end

  create_fake_advertiser_users
  create_fake_statuses
  create_fake_contacts
end
