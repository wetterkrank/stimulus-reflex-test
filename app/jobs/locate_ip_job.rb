class LocateIpJob < ApplicationJob
  queue_as :default

  def perform(ip, session_id)
    results = Geocoder.search(ip)
    puts results.inspect
    geo = results.first
    location = geo.city ? "#{geo.city}, #{geo.country}" : "Unknown Location"
    Rails.logger.info("#{location}, #{session_id}")

    cable_ready[session_id].console_log(message: "Welcome!").broadcast
    cable_ready[session_id].inner_html(selector: "#location", html: location).broadcast
  end
end
