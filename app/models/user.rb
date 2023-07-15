class User < ApplicationRecord
  has_many :lendings

  has_many :books, through: :reservations
  has_many :reservations
end
