module AuthenticableConcern
  extend ActiveSupport::Concern

  included do
    include ActiveModel::SecurePassword
    has_secure_password
    has_secure_password :recovery_password, validations: false
  end
end