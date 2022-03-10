require 'rails_helper'

RSpec.describe "nonprofits#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/nonprofits/#{nonprofit.id}"
  end

  describe 'basic destroy' do
    let!(:nonprofit) { create(:nonprofit) }

    it 'updates the resource' do
      expect(NonprofitResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Nonprofit.count }.by(-1)
      expect { nonprofit.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
