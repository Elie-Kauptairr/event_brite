class User < ApplicationRecord
  # Inclut les modules Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Un utilisateur peut être l'administrateur de plusieurs événements
  has_many :events, foreign_key: 'user_id', class_name: 'Event', dependent: :destroy
  
  # Un utilisateur peut participer à plusieurs événements
  has_many :attendances, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event

  # Envoi l'email de bienvenue après la création de l'utilisateur
  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
