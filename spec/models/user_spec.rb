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

end
