class User < ApplicationRecord
  # Associer un utilisateur à plusieurs événements et participations
  has_many :events, foreign_key: 'user_id'
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  validates :email, presence: true
  validates :encrypted_password, presence: true
end
