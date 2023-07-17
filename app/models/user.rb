class User < ApplicationRecord
  has_many :lendings

  has_many :books, through: :reservations
  has_many :reservations
  has_secure_password
# 空白と重複メールの禁止
  validates :mail, :name, :password, presence:{message: "は必須入力項目です"}
  validates :mail, uniqueness:{message: "このメールアドレスはすでに使用されています"}
end
