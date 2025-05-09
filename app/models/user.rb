# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :rides

  # Include default devise modules. Others available are:
  # :confirmable:lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :trackable,
         :recoverable,
         :rememberable,
         :validatable
  include DeviseTokenAuth::Concerns::User
end
