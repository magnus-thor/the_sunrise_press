FactoryBot.define do
  factory :user do
    password { 'password' }
    name { 'Jon' }
    email { 'mail@mail.com' }

    factory :member do
      email { 'mail@mail.com' }
      role { 0 }
    end

    factory :journalist do
      email { 'mail@mail.com' }
      role { 1 }
    end

    factory :editor do
      email { 'mail@mail.com' }
      role { 2 }
    end
  end
end
