require 'spec_helper'

describe Email do
  before { @contact = FactoryGirl.create(:contact) }
  subject { @contact }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:address) }
  it { should respond_to(:address2) }
  it { should respond_to(:city) }
  it { should respond_to(:region) }
  it { should respond_to(:postal_code) }
  it { should respond_to(:country) }

  it { should respond_to(:email) }
  it { should respond_to(:phone) }
  it { should respond_to(:website) }
  it { should respond_to(:fax) }
  it { should respond_to(:contact_form_url) }

  it { should respond_to(:skype) }
  it { should respond_to(:msn) }
  it { should respond_to(:aol) }
  it { should respond_to(:yahoo) }
  it { should respond_to(:icq) }

  it { should respond_to(:facebook) }
  it { should respond_to(:google_plus) }
  it { should respond_to(:twitter) }

  describe "when email not valid" do
    before { @contact.email = 'wrong@email' }
    it { should_not be_valid }
  end
end