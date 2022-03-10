require "rails_helper"

RSpec.describe "nonprofits#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/nonprofits/#{nonprofit.id}", params: params
  end

  describe "basic fetch" do
    let!(:nonprofit) { create(:nonprofit) }

    it "works" do
      expect(NonprofitResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("nonprofits")
      expect(d.id).to eq(nonprofit.id)
    end
  end
end
