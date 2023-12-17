class CheckDomainController < ApplicationController
  def show
    domain_hosted_here = params[:domain] == 'demo-pro.maglev.dev' || Site.exists?(domain: params[:domain])
    head domain_hosted_here ? :ok : :not_found
  end
end