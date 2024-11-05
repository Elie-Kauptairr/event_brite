class Event < ApplicationRecord
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id' # Associe chaque événement à son administrateur

  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, inclusion: { in: 1..1000 }
  validates :location, presence: true

  private

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date < Time.now
  end
end
