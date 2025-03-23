# frozen_string_literal: true

FactoryBot.define do
  factory :ride do
    destination { "Madrid"}
    origin { "Barcelona"}
    completed { true }
    price { 100 }

    user
  end

  factory :user do
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
