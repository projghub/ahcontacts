require 'spec_helper'

model_name = "Statuses"
singular = make_singular(model_name)

describe "when admin_user is not authorized" do
  it_behaves_like "unauthorized user", :admin, model_name
end

describe "when admin_user is authorized" do
  include_context "admin logged in"

  before(:each) do
    @object = FactoryGirl.create(:status)
  end

  it_behaves_like "visit model index", :admin, model_name

  it_behaves_like "visit model new", :admin, model_name, singular

  it_behaves_like "visit model show", :admin, model_name, singular do
    let(:object) { @object }
  end
end
