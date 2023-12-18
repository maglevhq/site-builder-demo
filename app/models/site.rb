class Site < ApplicationRecord
  ## associations ##
  belongs_to :user

  ## validations ##
  validates :name, presence: true
  validates :domain, uniqueness: { only_blank: true }
end
