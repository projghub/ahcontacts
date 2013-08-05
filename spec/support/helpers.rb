def sign_in(namespace, user)
  visit send("#{namespace}_login_path")
  within('#login') do
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
  end
  click_button 'Sign In'
end

shared_examples_for "unauthorized user" do |namespace, model_name|
  please_sign_in = "Please sign in"

  describe "#{model_name} index" do
    it "should have the content #{please_sign_in}" do
      visit send("#{namespace}_#{model_name.downcase.gsub(' ', '_')}_path")
      page.should have_content(please_sign_in)
    end
  end
end

shared_examples_for "visit model index" do |namespace, model_name|
  it "should have the content '#{model_name}'" do
    visit send("#{namespace}_#{model_name.downcase.gsub(' ', '_')}_path")
    page.should have_content(model_name)
  end
end

shared_examples_for "visit model new" do |namespace, model_name, singular|
  it "should have the content '#{model_name}'" do
    visit send("new_#{namespace}_#{singular.downcase.gsub(' ', '_')}_path")
    page.should have_content("New #{singular}")
  end
end

shared_examples_for "visit model show" do |namespace, model_name, singular|
  it "should have the content '#{model_name}'" do
    visit send("#{namespace}_#{singular.downcase.gsub(' ', '_')}_path", object)
    page.should have_content(singular)
  end
end

def make_singular(model_name)
  ActiveSupport::Inflector.singularize(model_name)
end
