# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_admin!
  #before_action :move_to_signed_in

  # GET /resource/sign_in
  # def new アクション
  #   super
  # end

  # POST /resource/sign_in
  # def create アクション
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy アクション
  #   super
  # end

  def after_sign_in_path_for(resource)
    admin_root_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  # protected
  protected

  #def move_to_signed_in
  #  unless user_signed_in?
  #    #サインインしていないユーザーはログインページが表示される
  #    redirect_to  new_admin_session_path
  #  end
  #end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
