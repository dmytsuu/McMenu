class User
  include ActiveModel::SecurePassword
  include Mongoid::Document
  include Mongoid::Timestamps

  field :password_digest, type: String
  field :email, type: String
  field :name, type: String

  has_secure_password
end
