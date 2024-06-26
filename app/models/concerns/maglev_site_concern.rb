# frozen_string_literal: true

module MaglevSiteConcern
  extend ActiveSupport::Concern

  included do
    ## associations ##
    has_one :maglev_site, class_name: 'Maglev::Site', as: :siteable, dependent: :destroy

    ## callbacks ##
    after_commit :update_maglev_site
  end

  ## public methods ##

  def generate_maglev_site
    return false if maglev_site # create it once

    Maglev::Pro::GenerateSite.call(
      siteable: self,
      theme_id:,
      name: self.name,
      domain: self.domain,
      locales: [{ label: 'English', prefix: 'en' }] # or replace by a list of locales
    )
  end

  ## private methods ##

  private

  def update_maglev_site
    # If the parent got updated, the new values of attributes like the
    # name of the site or the domain name has to be carried to the Maglev site too.
    # Example:
    #
    # return unless name_previously_changed? || domain_previously_changed?
    return if !persisted? || !maglev_site

    maglev_site.update(name: self.name, domain: self.domain)
  end
end
