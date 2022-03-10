require "rails_helper"

RSpec.describe "nonprofits#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/nonprofits", params: params
  end

  describe "basic fetch" do
    let!(:nonprofit1) { create(:nonprofit) }
    let!(:nonprofit2) { create(:nonprofit) }

    it "works" do
      expect(NonprofitResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["nonprofits"])
      expect(d.map(&:id)).to match_array([nonprofit1.id, nonprofit2.id])
    end
  end
end
