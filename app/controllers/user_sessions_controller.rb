class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user_session][:email])
    if user && user.authenticate(params[:user_session][:password]) 
      log_in_with user
      redirect_to top_pages_url, success: 'Login successful!'
    else
      # 他人のアカウントでログインしようとする人へのヒントとならない様に、入力されたメールアドレスが存在する場合も同じエラーメッセージを返す
      flash.now[:danger] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path, success: 'Logout successful!'
  end
end
