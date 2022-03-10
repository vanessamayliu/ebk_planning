require 'rails_helper'

RSpec.describe NonprofitResource, type: :resource do
  describe 'serialization' do
    let!(:nonprofit) { create(:nonprofit) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(nonprofit.id)
      expect(data.jsonapi_type).to eq('nonprofits')
    end
  end

  describe 'filtering' do
    let!(:nonprofit1) { create(:nonprofit) }
    let!(:nonprofit2) { create(:nonprofit) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: nonprofit2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([nonprofit2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:nonprofit1) { create(:nonprofit) }
      let!(:nonprofit2) { create(:nonprofit) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            nonprofit1.id,
            nonprofit2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            nonprofit2.id,
            nonprofit1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
