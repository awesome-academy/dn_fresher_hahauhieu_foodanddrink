require "rails_helper"
include SessionsHelper

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    before do
      user = FactoryBot.create(:user, role: 0)
      5.times do
        create(:order, user_id: user.id)
      end
      log_in user
      get :show, params: { id: user }
    end

    it "assigns products" do
      expect((assigns :user_orders).count).to eq 5
    end

    it "returns a success response" do
      expect(response).to render_template("show")
    end
  end
end
