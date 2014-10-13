class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = find_user_by_id
    @product = Product.new
  end

  def create
    user = find_user_by_id
    product = Product.new(product_params.merge({ user_id: user.id }))

    if product.save
      flash[:success] = t('products.create.success_message', product: product.title)
      redirect_to dashboard_user_path(user)
    else
      render 'new'
    end
  end

  def edit
    @user = find_user_by_id
    @product = find_product_by_id
  end

  def update
    user = find_user_by_id
    product = find_product_by_id

    if product.update_attributes(product_params.merge({ user_id: user.id }))
      flash[:success] = t('products.update.success_message', product: product.title)
      redirect_to dashboard_user_path(user)
    else
      render 'edit'
    end
  end

  def show
    @product = find_product_by_id
  end

  private

  def find_user_by_id
    User.find(params[:user_id])
  end

  def find_product_by_id
    Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :title, :description, :shipping_policy, :price, :quantity
    )
  end
end
