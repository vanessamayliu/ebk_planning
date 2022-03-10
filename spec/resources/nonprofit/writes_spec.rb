require 'rails_helper'

RSpec.describe NonprofitResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'nonprofits',
          attributes: { }
        }
      }
    end

    let(:instance) do
      NonprofitResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Nonprofit.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:nonprofit) { create(:nonprofit) }

    let(:payload) do
      {
        data: {
          id: nonprofit.id.to_s,
          type: 'nonprofits',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      NonprofitResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { nonprofit.reload.updated_at }
      # .and change { nonprofit.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:nonprofit) { create(:nonprofit) }

    let(:instance) do
      NonprofitResource.find(id: nonprofit.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Nonprofit.count }.by(-1)
    end
  end
end
