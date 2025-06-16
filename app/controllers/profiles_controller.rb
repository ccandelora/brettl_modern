class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if user_params[:password].present?
      # If password is being updated, require current password
      if @user.update_with_password(user_params_with_password)
        bypass_sign_in(@user) # Keep user signed in after password change
        redirect_to profile_path, notice: "Profile updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    else
      # If no password change, update without requiring current password
      if @user.update(user_params_without_password)
        redirect_to profile_path, notice: "Profile updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params_with_password
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

  def user_params_without_password
    params.require(:user).permit(:name, :email)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
