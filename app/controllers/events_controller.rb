class EventsController < ApplicationController
  def index
    # @tonights_event = Event.tonight
    @upcoming_events = Event.upcoming.order(:date)
    @past_events = Event.old.order(:date)
  end

  def show

  end

  def new

    @band_names = Band.pluck(:name)

    @event = Event.new
    4.times { @event.bands.build }

  end

  def create
    redirect_to root_url

    @event = Event.new(event_params)

    if @event.save
      params[:bands].each do |band|
        next if band[:name].empty?
        if Band.exists?(name: band[:name])
          @event.bookings.create!(band_id: Band.where(name: band[:name]).first.id)
        else
          @event.bands.create!(name: band[:name])
        end
      end
      # flash[:success] = params[:bands][0]
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :time, :image)
  end
end
