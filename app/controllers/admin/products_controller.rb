class Admin::ProductsController < Admin::BaseController
  def index
    products = Product.newest
    if products.empty?
      flash[:danger] = t "errors.not_found_product"
      redirect_to admin_products_path
    else
      @pagy, @products = pagy products, items: Settings.per_page_10
    end
  end
end
