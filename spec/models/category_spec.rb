require "rails_helper"

RSpec.describe Category, type: :model do
  describe "association" do
    it { is_expected.to belong_to(:parent).optional(true) }
    it { is_expected.to have_many(:products).dependent(:destroy) }
    it { is_expected.to have_many(:children).dependent(:destroy) }
  end
end
