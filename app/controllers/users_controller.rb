class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = User.find(params[:id])
    @products = @user.products
  end
end
