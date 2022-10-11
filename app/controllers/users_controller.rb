class UsersController < ApplicationController
def index
	@users = User.all
end

def new
	@user = User.new
end

def create
	@user = User.new(params.require(:user).permit(:title, :start, :end_day, :confirmation))
	if @user.save
		# 投稿が作成できた場合 
		flash[:notice] = "ユーザーを新規登録しました"
		redirect_to :users
	else
		# 投稿が作成できなかった場合
		flash.now[:notice] = "投稿を作成出来ませんでした"
		render "new", status: :unprocessable_entity
	end
end

def show
	@user = User.find(params[:id])
end

def edit  
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
		if @user.update(params.require(:user).permit(:title, :start, :end_day, :confirmation))
			flash[:notice] = "ユーザーIDが「#{@user.id}」のスケジュールを更新しました"
			redirect_to :users
		else
			render "edit" ,status: :unprocessable_entity
		end
end

def destroy
	@user = User.find(params[:id])
	@user.destroy
	flash[:notice] = "ユーザーを削除しました"
	redirect_to :users
end
end
