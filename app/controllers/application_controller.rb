class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, except: [:top]#public: :top, about
  #before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :move_to_signed_in, except: [:top]

  #def after_sign_in_path_for(resource)
   # admin_root_path
  #end

  #def after_sign_out_path_for(resource)
   # about_path
  #end

  #protected

  #def configure_permitted_parameters
   # devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  #end
end
