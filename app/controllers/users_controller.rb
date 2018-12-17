class UsersController < ApplicationController
    before_action :edit_user, only: [:edit]
    before_action :set_user, only: [:show, :edit, :update, :favorite]
    before_action :require_logged_in!, only: [:show, :edit, :update, :favorite]
    
    def new
        @user = User.new
    end

def create
    @user = User.new(user_params)
    if @user.save
        redirect_to user_path(@user.id)
    else
        render 'new'
  end
end

def show
    @user = User.find(params[:id])
    
end

def edit
end

def update
  if @user.update(user_params)
    redirect_to user_path notice: "ユーザーを編集しました！"
  else
    render 'edit'
  end
end



def favorite
  @user = User.find(params[:id])
  @favorites_blogs = @user.favorites
end

def edit_user
  unless @user.id == current_user.id  
    redirect_to user_path, notice: "投稿者以外は編集できません！！"
  end
end


private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image, :image_cache)
  end
  def set_user
    @user = User.find(params[:id])
  end
end

 

