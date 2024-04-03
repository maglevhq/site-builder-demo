class ApplicationController < ActionController::Base
  include AuthenticationConcern
  include HoneybadgerContextConcern
end
