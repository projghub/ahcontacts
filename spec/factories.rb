FactoryGirl.define do
  factory :admin_user, class: Admin::User do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name) { |n| "Last #{n}" }
    email "admin@example.com"
    password "password"

    before(:create) do
      permission = Admin::Permission.create(namespace: 'admin', controller: 'application')
      permission = Admin::Permission.create(namespace: 'admin', controller: 'full')
    end

    after(:create) do |admin_user|
      pu = admin_user.permissions_users.new
      pu.permission_id = 1
      pu.save

      pu = admin_user.permissions_users.new
      pu.permission_id = 2
      pu.save
    end
  end

  factory :advertiser_user, aliases: [:user], class: Advertiser::User do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name) { |n| "Last #{n}" }
    sequence(:email) { |n| "advertiser#{n}@example.com" }
    password "password"

    before(:create) do
      permission1 = Admin::Permission.create(namespace: 'advertiser', controller: 'application')
      permission2 = Admin::Permission.create(namespace: 'advertiser', controller: 'full')
    end

    after(:create) do |advertiser_user|
      pu = advertiser_user.permissions_users.new
      permission = Admin::Permission.where(namespace: 'advertiser', controller: 'application').first
      pu.permission_id = permission.id
      pu.save

      pu = advertiser_user.permissions_users.new
      permission = Admin::Permission.where(namespace: 'advertiser', controller: 'full').first
      pu.permission_id = permission.id
      pu.save
    end
  end

  factory :permission do
    namespace :admin
    controller :application
    action ""
  end

    trait :admin_application do
      namespace :admin
      controller :application
      action ''
    end

    trait :admin_full do
      namespace :admin
      controller :full
      action ''
    end

    trait :advertiser_application do
      namespace :advertiser
      controller :application
      action ''
    end

    trait :advertiser_full do
      namespace :advertiser
      controller :full
      action ''
    end

  factory :contact do    
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name) { |n| "Last #{n}" }
    sequence(:email) { |n| "email-#{n}@example.org" }
  end
  
  factory :email do
    sequence(:name) { |n| "Email #{n}" }
    from_name "Customer Support"
    from_email "support@example.org"
    email_text "Thanks for signing up"
    email_html "<h1>Thanks for signing up</h1>"
	sequence(:subject) { |n| "Subject #{n}" }
    publish true
  end

  factory :tag do
    sequence(:name) { |n| "Tag #{n}" }
  end

  factory :tagging do
    tag
    customer
  end
end
