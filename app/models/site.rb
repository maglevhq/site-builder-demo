class Site < ApplicationRecord
  ## concerns ##
  include MaglevSiteConcern

  ## associations ##
  belongs_to :user
  
  ## validations ##
  validates :name, presence: true
  validates :domain, uniqueness: { only_blank: true }
  validates :theme_id, presence: true, on: :create

  ## virtual attributes ##
  attr_accessor :theme_id

  ## methods ##

  def save_and_create_maglev_site
    if maglev_site
      errors.add(:base, "A maglev site already exists")
      return false
    end
    
    transaction do 
      if save
        generate_maglev_site
      end
      errors.empty?
    end
  end
end
