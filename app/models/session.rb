class Session < ApplicationRecord
  field :name, type: String
  # field :private, type: Boolean, default: false
  field :finish_at, type: Time

  has_many :buckets

  validates :name, :finish_at, presence: true
  # validates :finish_at, numericality: { greater_than: Time.now.to_i }
end
