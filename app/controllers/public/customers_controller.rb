class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_mypage_path
    else
      render :edit
    end
  end

  def confirm
  end

  def withdraw
    @customer = current_customer
    # is_activeカラムをfalseに変更することにより削除フラグを立てる
    @customer.update(is_active: false)
    reset_session
    #flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email,
                                     :last_name,
                                     :last_name_kana,
                                     :first_name,
                                     :first_name_kana,
                                     :postal_code,
                                     :address,
                                     :telephone_number,
                                     :is_deleted)
  end
end
