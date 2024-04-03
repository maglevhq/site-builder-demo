module HoneybadgerContextConcern
  extend ActiveSupport::Concern

  included do
    before_action :build_honeybadger_context
  end

  private

  def build_honeybadger_context
    Honeybadger.context({
      user_id: current_user&.id,
      user_email: current_user&.email
    })
  end
end