require 'rails_helper'

RSpec.describe "nonprofits#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/nonprofits", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'nonprofits',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(NonprofitResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Nonprofit.count }.by(1)
    end
  end
end
