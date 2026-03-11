class CheckDomainController < ApplicationController
  def show
    host = params[:domain].presence || params[:host].presence
    host = host.to_s.strip

    domain_hosted_here =
      host.present? && (host == Rails.application.config.x.main_host || Site.exists?(domain: host))

    head domain_hosted_here ? :ok : :not_found
  end
end