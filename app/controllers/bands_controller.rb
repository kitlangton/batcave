class BandsController < ApplicationController

  def update_multiple
    Band.update(params[:bands].keys, params[:bands].values)
    event = Event.find(params[:event_id])
    redirect_to event_path(event)
    create_soundcloud_playlist(event)
  end

  def create_soundcloud_playlist(event)
    client = SoundCloud.new({
      :client_id     => 'cb7c038ba6c4c9b4d7a743366f5659f4',
      :client_secret => '6e2f053cc79982dc9506094a59e90122',
      :username      => 'kitlangton@gmail.com',
      :password      => 'radar23'
    })

    tracks = []

    params[:bands].values.each do |band_url|
      next if band_url[:sound_cloud_url].empty?
      uri = URI.parse("http://api.soundcloud.com/resolve.json?url=#{band_url[:sound_cloud_url]}&client_id=YOUR_CLIENT_ID")
      resp = Net::HTTP.get_response(uri)
      buffer = resp.body
      result = JSON.parse(buffer)
      string = result["location"].to_s
      id = string.match(/\/(\d+)\./)
      tracks << client.get("/users/#{id[1]}/tracks").first
    end

    playlist = client.post('/playlists', :playlist => {
      :title => "Batcave Preview: #{event.show_time.strftime("%B %d")}",
      :sharing => 'public',
      :tracks => tracks,
    })

  end

end
