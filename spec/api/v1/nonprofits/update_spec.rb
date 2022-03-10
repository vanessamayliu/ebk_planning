require 'rails_helper'

RSpec.describe "nonprofits#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/nonprofits/#{nonprofit.id}", payload
  end

  describe 'basic update' do
    let!(:nonprofit) { create(:nonprofit) }

    let(:payload) do
      {
        data: {
          id: nonprofit.id.to_s,
          type: 'nonprofits',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(NonprofitResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { nonprofit.reload.attributes }
    end
  end
end
