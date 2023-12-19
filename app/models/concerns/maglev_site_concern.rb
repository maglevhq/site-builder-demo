module MaglevSiteConcern
  extend ActiveSupport::Concern

  included do
    ## associations ##
    has_one :maglev_site, class_name: 'Maglev::Site', as: :siteable, dependent: :destroy

    ## callbacks ##
    after_update :update_maglev_site
  end

  ## public methods ##

  def generate_maglev_site(theme: 'default')
    return false if maglev_site

    Maglev::Pro::GenerateSite.call(
      siteable: self, 
      theme_id: theme, 
      name: self.name, 
      domain: self.domain,
      locales: [{ label: 'English', prefix: 'en' }]
    )
  end

  ## private methods ##

  private

  def update_maglev_site
    return unless name_previously_changed? || domain_previously_changed?
    maglev_site.update(name: self.name, domain: self.domain)
  end
end