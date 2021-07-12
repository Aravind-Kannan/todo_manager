class User < ApplicationRecord
  has_secure_password
  #validates :first_name, presence: true
  #validates :email, presence: true
  has_many :todos

  def to_pleasant_string
    "#{id}. #{name} --- #{email} --- #{password}"
  end
end
