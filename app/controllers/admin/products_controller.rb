class Admin::ProductsController < Admin::BaseController
  authorize_resource

  def index
    @pagy, @products = pagy Product.newest, items: Settings.per_page_10
  end
end
