require 'rails_helper'

RSpec.describe ChannelsController, type: :controller do
  describe 'GET #index' do
    before do
      create(:channel)
      get :index
    end


    it { expect(response).to have_http_status(:success) }
    it { expect(assigns(:channels)).not_to be_nil }
  end

  describe 'POST #create' do
    before { post :create, channel: params }

    context 'with valid params' do
      let(:params) { { name: 'random' } }

      it { expect(assigns(:channel)).to be_persisted }
    end

    context 'with invalid params' do
      let(:params) { { name: '' } }

      it { expect(assigns(:channel)).to be_new_record }
      it { expect(response).to redirect_to(channels_path) }
    end
  end

  describe 'GET #show' do
    let!(:channel) { create(:channel) }

    before { get :show, id: channel.id }

    it { expect(assigns(:channel)).to be_persisted }
    it { expect(response).to have_http_status(:success) }
  end
end
