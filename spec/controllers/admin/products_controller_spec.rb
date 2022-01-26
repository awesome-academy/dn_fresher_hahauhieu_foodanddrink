require "rails_helper"
include SessionsHelper

RSpec.describe Admin::ProductsController, type: :controller do
  describe "GET #index" do
    context "when product empty" do
      let!(:products) {}
      before do
        user = FactoryBot.create(:user, role: 1)
        log_in user
        get :index
      end
      it "redirect to products path" do
        expect(response).to redirect_to admin_products_path
      end

      it "show flash message" do
        expect(flash[:danger]).to eq I18n.t("errors.not_found_product")
      end
    end

    context "when product exist" do
      let!(:products) {create_list(:product, 10)}
      before do
        user = FactoryBot.create(:user, role: 1)
        log_in user
        get :index
      end
      it "returns a success response" do
        expect(response).to render_template("index")
      end

      it "assigns products" do
        expect((assigns :products).count).to eq products.count
      end
    end
  end
end
