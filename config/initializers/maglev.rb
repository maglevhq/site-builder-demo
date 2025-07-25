# frozen_string_literal: true

Maglev.configure do |config|
  # Title of the Editor window
  config.title = 'PageBuilder - Editor'

  # Logo of the Editor (top left corner).
  # Put your custom logo in the app/assets/images folder of your Rails application.
  config.logo = 'logo.svg'

  # Favicon (window tab)
  # Put your custom favicon in the app/assets/images folder of your Rails application.
  config.favicon = 'favicon.svg'

  # Primary color of the Editor
  config.primary_color = '#040712'

  # Action triggered when clicking on the very bottom left button in the Editor
  # config.back_action = 'https://www.mysite.dev' # External url
  config.back_action = :sites_path # name of the route in your Rails application
  # config.back_action = ->(site) { redirect_to main_app.my_account_path(site_id: site.id) }

  # I18n locale used in the Editor UI (by default, I18n.locale will be used)
  # config.ui_locale = 'fr' # make sure your locale has been registered in Rails.
  # config.ui_locale = :find_my_locale # name of any protected method from your Rails application controller
  # config.ui_locale = ->(site) { 'fr' }

  # Default locales of a site. By default, Maglev will use English (en).
  # This setting will only be used when creating the site.
  # If you want add more locales to your site, use the SetSiteLocalesService (https://docs.maglev.dev/guides/i18n).
  # The first locale of the array will be considered as the default locale of the site
  # config.default_site_locales = [
  #  { label: 'English', prefix: 'en' },
  #  { label: 'French', prefix: 'fr' }
  # ]

  # Editor UI authentication (https://docs.maglev.dev/guides/setup-authentication)
  # config.is_authenticated = :editor_allowed? # name of any protected method from your Rails application controller
  config.is_authenticated = ->(site) do 
    return false if !site || !current_user
    Rails.logger.info "🔐 site##{site.id} owned by user##{site.siteable.user_id} and requested by user##{current_user&.id}"
    site.siteable.user_id == current_user&.id
  end

  # Admin UI authentication (https://docs.maglev.dev/guides/setup-authentication)
  config.admin_username = Rails.env.production? ? ENV.fetch('MAGLEV_ADMIN_USERNAME') : nil
  config.admin_password = Rails.env.production? ? ENV.fetch('MAGLEV_ADMIN_PASSWORD') : nil

  # Uploader engine (:active_storage is only supported for now)
  config.uploader = :active_storage

  # Collections mapping (https://docs.maglev.dev/guides/setup-collections)
  # config.collections = {
  #   products: {
  #     model: 'Product',
  #     fields: {
  #       label: :name,
  #       image: :thumbnail_url
  #     }
  #   }
  # }

  # Let your content editors references existing pages of your application but
  # not served/rendered by Maglev.
  # config.static_pages = [
  #   {
  #     title: { en: 'Products', fr: 'Produits' },
  #     path: { en: 'products', fr: 'fr/produits' }
  #   },
  #   {
  #     title: { en: 'Authentication', fr: 'Authentification' },
  #     path: { en: 'sign-in', fr: 'fr/se-connecter' }
  #   }
  # ]

  # Prevent the content editors to create pages sharing the same path with other
  # existing pages of the application.
  # config.reserved_paths = %w(products sign-in search)
end
