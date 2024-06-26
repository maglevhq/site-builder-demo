module SitesHelper

  def site_preview_url(site)
    maglev.site_preview_url(site_handle: site.maglev_site.handle, locale: 'en')
  end

  def site_live_url(site)
    URI::HTTP.build(host: site.domain, port: request.port, protocol: request.ssl?).to_s
  end

  def edit_site_content_url(site)
    maglev.base_editor_url(site_handle: site.maglev_site.handle, host: Rails.application.config.x.main_host, locale: 'en')
  end

end
