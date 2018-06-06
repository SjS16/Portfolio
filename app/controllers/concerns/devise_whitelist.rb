module DeviseWhitelist
  extend ActiveSupport::Concern

  #check if its a devise controller then update the whitelisted parameters
  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    #devise for ruby v5 function to add name to sign up and edit pages
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end