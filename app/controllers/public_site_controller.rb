class PublicSiteController < ApplicationController
  layout nil

  def show
    @site = Site.find_by(domain: request.host)
    head :not_found unless @site
  end
end
