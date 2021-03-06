class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #moved to a concern module so that we aren't doing too many things in a controller where it shouldn't be
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
end