class ApplicationController < ActionController::Base
  include AuthenticationConcern
  include HoneybadgerContextConcern
  
  helper Ncuikit::ApplicationHelper
end
