module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin!
    before_action :set_user, only: %i[show edit update destroy]

    # GET /admin/users
    def index
      @users = User.includes(:reservations)
                   .order(:name, :email)

      # Add search functionality
      if params[:search].present?
        @users = @users.where(
          "name ILIKE ? OR email ILIKE ?",
          "%#{params[:search]}%",
          "%#{params[:search]}%"
        )
      end

      # Add role filter
      if params[:role].present?
        case params[:role]
        when "admin"
          @users = @users.where(role: 2)
        when "member"
          @users = @users.where.not(role: 2).or(@users.where(role: nil))
        end
      end

      @users = @users.page(params[:page]) if respond_to?(:page)
    end

    # GET /admin/users/1
    def show
      @reservations = @user.reservations.includes(:reservation_week).order(created_at: :desc).limit(10)
    end

    # GET /admin/users/new
    def new
      @user = User.new
    end

    # GET /admin/users/1/edit
    def edit
    end

    # POST /admin/users
    def create
      @user = User.new(user_params)
      @user.skip_confirmation! # Admin-created users don't need email confirmation

      if @user.save
        redirect_to admin_user_path(@user), notice: "User was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /admin/users/1
    def update
      # Handle password updates differently
      if user_params[:password].present?
        if @user.update(user_params)
          redirect_to admin_user_path(@user), notice: "User was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
      else
        # Update without password
        if @user.update(user_params.except(:password, :password_confirmation))
          redirect_to admin_user_path(@user), notice: "User was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
      end
    end

    # DELETE /admin/users/1
    def destroy
      if @user == current_user
        redirect_to admin_users_path, alert: "You cannot delete your own account."
        return
      end

      @user.destroy
      redirect_to admin_users_path, notice: "User was successfully deleted."
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :sex, :membership_type)
    end

    def ensure_admin!
      redirect_to root_path, alert: "Access denied. Admin privileges required." unless current_user.admin?
    end
  end
end
