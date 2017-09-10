FactoryGirl.define do
  factory :admin do
    sequence(:email) {|n| "admin#{n}@example.com"}
    first_name 'Teddy'
    last_name 'Stanowski'
    username 'TeddyS31'
    password 'password31'
    password_confirmation 'password31'
  end
end
