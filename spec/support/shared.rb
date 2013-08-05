module Shared
  shared_context "admin logged in" do
    before(:each) do
      @admin_user = FactoryGirl.create(:admin_user)
      sign_in :admin, @admin_user
    end
  end

  shared_context "advertiser logged in" do
    before(:each) do
      @advertiser_user = FactoryGirl.create(:advertiser_user)
      sign_in :advertiser, @advertiser_user
    end
  end
end
