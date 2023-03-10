# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]

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

  # ログインした遷移先
  def after_sign_in_path_for(resource)
     customers_mypage_path
  end

  # ログアウトした遷移先
  def after_sign_out_path_for(resource)
     customer_session_path
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    @customer.valid_password?(params[:customer][:password])
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == true)
      ## 【処理内容3】
      #redirect_to customer_session_path
    end


  end

  def after_sign_in_path_for(resource)
    public_homes_top_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
