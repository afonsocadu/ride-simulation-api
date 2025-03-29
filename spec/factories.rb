# frozen_string_literal: true

FactoryBot.define do
  factory :ride do
    destinationLatitude { 40.4168 }
    destinationLongitude { -3.7038 }
    originLatitude { 40.500 }
    originLongitude { -3.700 }
    price { 100 }
    completed { false }

    user
  end

  factory :user do
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    password { |n| "password#{n}" }
    password_confirmation { |n| "password#{n}" }
  end
end
