class MapController < ApplicationController
  def show
    Rails.logger.info("MapController#show: #{request.session.id.to_s}")
    LocateIpJob.perform_later(request.remote_ip, request.session.id.to_s)
  end
end
