require 'soundcloud'

class EventsController < ApplicationController
  def index
    # @tonights_event = Event.tonight
    @upcoming_events = Event.upcoming.order(:date)
    @past_events = Event.old.order(:date)
  end

  def show
    @event = Event.find(params[:id])
    @embed_info = @event.playlist_url
  end

  def new

    @band_names = Band.pluck(:name)
    @event = Event.new

  end

  def create
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

      if @event.bands.any? {|band| band.date_configured.nil?}
        redirect_to :controller => "events", :action => "configure", :id => @event.id
      else
        redirect_to root_url
      end
      # create_soundcloud_playlist(@event)
      # flash[:success] = params[:bands][0]
    else
      render 'new'
    end
  end

  def configure
    @event = Event.find(params[:id])
    @bands = @event.bands.where(date_configured: nil)
  end

  private

  def event_params
    params.require(:event).permit(:date, :time, :image)
  end

  # def create_soundcloud_playlist(event)
  #   client = SoundCloud.new({
  #     :client_id     => 'cb7c038ba6c4c9b4d7a743366f5659f4',
  #     :client_secret => '6e2f053cc79982dc9506094a59e90122',
  #     :username      => 'kitlangton@gmail.com',
  #     :password      => 'radar23'
  #   })
  #
  #   tracks = []
  #
  #   event.bands.pluck(:name).each do |name|
  #     tracks << client.get('/tracks', :q => "#{name}", :licence => 'cc-by-sa').first
  #   end
  #
  #   playlist = client.post('/playlists', :playlist => {
  #     :title => "Batcave Preview: #{event.show_time.strftime("%B %d")}",
  #     :sharing => 'public',
  #     :tracks => tracks,
  #     :description => event.bands.pluck(:name).join("\n")
  #   })
  # end
end
