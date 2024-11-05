class AttendancesController < ApplicationController
  before_action :set_event

  def create
    @attendance = @event.attendances.new(user: User.first, stripe_customer_id: "test_customer_id")
    if @attendance.save
      redirect_to @event, notice: "Inscription réussie à l'événement."
    else
      redirect_to @event, alert: "Erreur lors de l'inscription."
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
