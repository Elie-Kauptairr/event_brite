class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, presence: true

  # Envoi un email après la création d'une participation
  after_create :send_participation_email

  private

  def send_participation_email
    UserMailer.event_participation_email(event, user).deliver_now
  end
end
