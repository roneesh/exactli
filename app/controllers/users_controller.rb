class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @documents = Document.where(user_id: @user.id)
    
  end

  def archive_delete
    @user = User.find(params[:id])
    @document_tree = []
    @documents = Document.where(user_id: @user.id)

  end

end
