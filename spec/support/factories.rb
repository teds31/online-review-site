FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "person#{n}@example.com"}
    first_name 'Teddy'
    last_name 'Stanowski'
    username 'TeddyS31'
    password 'password1'
    password_confirmation 'password1'
  end

  factory :product do
    sequence(:name) {|n| "Wine#{n}"}
    maker 'Montauk Vineyards'
    location 'Montauk, Long Island'
    year '2012'
    association :user, factory: :user
  end


  # factory :attachment do
  #    after :create do |b|
  #      b.update_column(:wine_photo, "foo/bar/baz.png")
  #    end
  #  end

end
