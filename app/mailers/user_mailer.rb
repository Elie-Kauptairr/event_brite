class UserMailer < ApplicationMailer
  default from: 'no-reply@eventbrite-clone.com'

  # Méthode pour l'email de bienvenue
  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Bienvenue sur Eventbrite-clone !')
  end

  # Méthode pour l'email de participation à un événement
  def event_participation_email(event, participant)
    @event = event
    @participant = participant
    mail(to: @event.admin.email, subject: 'Nouvelle participation à ton événement')
  end
end
