class User < ApplicationRecord
  before_save {self.email == self.email.downcase}
  #before_saveはコールバックメソッドと呼ばれるもの
  #before_saveにはブロックが渡されている
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
              format: {with: VALID_EMAIL_REGEX},
              uniqueness:  {case_sensitive: false}
  #presence trueはオプションハッシュである
  #validatesメソッドの引数がnameというカラムとpresenceというキーを持っているハッシュだと思えば良い
  has_secure_password
  #このrailsのメソッドはpassword_digestというカラムが存在するかつ,gem bcryptがある時のみ使用できる
  validates :password, presence: true, length: {minimum: 6}
end
