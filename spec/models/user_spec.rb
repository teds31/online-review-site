require 'rails_helper'

RSpec.describe User, type: :model do
  it {should have_valid(:first_name).when('Teddy', 'John')}
  it {should_not have_valid(:first_name).when(nil, '')}

  it {should have_valid(:last_name).when('Stanowski', 'Smith')}
  it {should_not have_valid(:last_name).when(nil, '')}

  it {should have_valid(:email).when('teddy@teddy.com', 'Smith@matrix.com')}
  it {should_not have_valid(:email).when(nil, '', 'urser', 'users@com')}

  it {should have_valid(:username).when('Stanowski31', 'SmithKungFu2001')}
  it {should_not have_valid(:username).when(nil, '')}

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password1'
    user.password = 'password12'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

  describe "#admin?" do
  it "is not an admin if the role is not admin" do
    user = FactoryGirl.create(:user, role: "member")
    expect(user.admin?).to eq(false)
  end

  it "is an admin if the role is admin" do
    user = FactoryGirl.create(:user, role: "admin")
    expect(user.admin?).to eq(true)
  end
end

end
