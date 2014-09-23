class BandsController < ApplicationController

  def update_multiple
    Band.update(params[:bands].keys, params[:bands].values)
    event = Event.find(params[:event_id])
    redirect_to event_path(event)
    create_soundcloud_playlist(event)
  end

  def create_soundcloud_playlist(event)
    client = SoundCloud.new({
      :client_id     => ENV['SOUNDCLOUD_KEY'],
      :client_secret => ENV['SOUNDCLOUD_SECRET'],
      :username      => ENV['SOUNDCLOUD_USERNAME'],
      :password      => ENV['SOUNDCLOUD_PASSWORD']
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
