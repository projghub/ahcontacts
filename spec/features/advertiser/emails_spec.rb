require 'spec_helper'

model_name = "Emails"
singular = make_singular(model_name)

describe "when advertiser_user is not authorized" do
  it_behaves_like "unauthorized user", :advertiser, model_name
end

describe "when advertiser_user is authorized" do
  include_context "advertiser logged in"

  before(:each) do
    @object = FactoryGirl.create(:email)
  end

  it_behaves_like "visit model index", :advertiser, model_name

  it_behaves_like "visit model new", :advertiser, model_name, singular

  it_behaves_like "visit model show", :advertiser, model_name, singular do
    let(:object) { @object }
  end
end
