class User < ApplicationRecord
  ## concerns ##
  include AuthenticableConcern

  ## associations ##
  has_many :sites, dependent: :destroy

  ## validations ##
  validates :email, presence: true, uniqueness: true

end
