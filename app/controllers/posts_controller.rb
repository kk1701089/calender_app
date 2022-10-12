class PostsController < ApplicationController
def index
	@posts = Post.all
end

def new
	@post = Post.new
end

def create
	@post = Post.new(params.require(:post).permit(:title, :start, :end_day, :all_day, :confirmation))
	if @post.save
		# 投稿が作成できた場合 
		flash[:notice] = "ユーザーを新規登録しました"
		redirect_to :posts
	else
		# 投稿が作成できなかった場合
		flash.now[:notice] = "スケジュールを作成出来ませんでした"
		render "new", status: :unprocessable_entity
	end
end

def show
	@post = Post.find(params[:id])
end

def edit  
	@post = Post.find(params[:id])
end

def update
	@post = Post.find(params[:id])
		if @post.update(params.require(:post).permit(:title, :start, :end_day, :confirmation))
			flash[:notice] = "ユーザーIDが「#{@post.id}」のスケジュールを更新しました"
			redirect_to :posts
		else
			render "edit" ,status: :unprocessable_entity
		end
end

def destroy
	@post = Post.find(params[:id])
	@post.destroy
	flash[:notice] = "ユーザーを削除しました"
	redirect_to :posts
end
end
