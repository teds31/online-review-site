FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com"}
    first_name 'Teddy'
    last_name 'Stanowski'
    username 'TeddyS31'
    password 'password1'
    password_confirmation 'password1'
  end
end
