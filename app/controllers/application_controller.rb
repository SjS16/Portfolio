class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #moved to a module so that we aren't doing too many things in a controller where it shouldn't be
  include DeviseWhitelist
end
