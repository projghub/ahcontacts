require 'spec_helper'

describe Email do
  before { @email = FactoryGirl.create(:email) }
  subject { @email }

  it { should respond_to(:name) }
  it { should respond_to(:subject) }
  it { should respond_to(:from_name) }
  it { should respond_to(:from_email) }
  it { should respond_to(:subject) }
  it { should respond_to(:email_text) }
  it { should respond_to(:email_html) }
  it { should respond_to(:publish) }

  describe "when name not present" do
    before { @email.name = '' }
    it { should_not be_valid }
  end

  describe "when subject not present" do
    before { @email.subject = '' }
    it { should_not be_valid }
  end

  describe "when from_email not valid" do
    before { @email.from_email = 'wrong@email' }
    it { should_not be_valid }
  end
end
