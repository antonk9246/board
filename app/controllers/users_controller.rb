class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      bypass_sign_in @user, scope: :user
      redirect_to ads_items_path, notice: (t 'user.password_updated').to_s
    else
      redirect_to ads_items_user_page_url,
                  notice: (t 'user.password_not_updated').to_s
    end
  end

  def update_avatar
    @user = User.find(current_user.id)
    if params[:user].nil?
      params[:user][:avatar] = nil
      redirect_to ads_items_user_page_url,
                  notice: (t 'user.avatar_not_updated').to_s
    else
      @user.update(user_params)
      redirect_to ads_items_user_page_url, notice: (t 'user.avatar_updated').to_s
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation,
                                 :current_password, :avatar)
  end
end
