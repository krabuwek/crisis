class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_tags#, only: [:index, :show]

  protected
    def configure_permitted_parameters
      added_attrs = [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    def set_tags 
      @tags = Tag.last(20)
    end
  private
    rescue_from CanCan::AccessDenied do |exception|
      render file: "#{Rails.root}/public/404", formats: [:html], status: 404, layout: false
    end
end
