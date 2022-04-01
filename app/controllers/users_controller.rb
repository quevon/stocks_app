class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :authorize_user!, only: [:index]

  def index
    if params[:approved] == "false"
      @users = User.where(approved: false)
    else
      @users = User.all
    end
  end

 
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if User.find(params[:id]).update(user_params)
        format.html {redirect_to current_user ,notice: 'You successfully updated your profile' }
      else 
        format.html {render :edit}
      end
    end
  end

  private 

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :approved,
      )
    end

    def authorize_user!
      if !current_user || !current_user.admin?
        redirect_to new_user_session_path
      end
    end
end
