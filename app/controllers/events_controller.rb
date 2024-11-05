class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.admin = current_user # Associe l'événement à l'utilisateur connecté
  
    if @event.save
      redirect_to @event, notice: "L'événement a été créé avec succès !"
    else
      # Affiche les erreurs en console pour déboguer
      puts @event.errors.full_messages
      render :new, alert: "Erreur lors de la création de l'événement."
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Événement mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Événement supprimé avec succès.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  end
end
