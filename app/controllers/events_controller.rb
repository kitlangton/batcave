class EventsController < ApplicationController
  def index
    # @tonights_event = Event.tonight
    @upcoming_events = Event.upcoming.order(:date)
    @past_events = Event.old.order(:date)
  end

  def show

  end

  def new
    @event = Event.new
    4.times { @event.bands.build }
  end

  def create
    redirect_to root_url

    @event = Event.new(event_params)

    if @event.save
      # flash[:success] = nil
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :time, :image, bands_attributes: [:name])
  end
end
