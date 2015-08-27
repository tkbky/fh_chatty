require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let!(:channel) { create(:channel) }

  before {
    allow_any_instance_of(MessagePublisher).to receive(:call).and_return(nil)
  }

  describe 'POST #create' do
    before { xhr :post, :create, message: params, channel_id: channel.id }

    context 'with valid params' do
      let(:params) { { text: 'random' } }

      it { expect(assigns(:channel)).not_to be_nil }
      it { expect(assigns(:message)).to be_persisted }
    end

    context 'with blank text' do
      let(:params) { { text: '' } }

      it { expect(assigns(:channel)).not_to be_nil }
      it { expect(assigns(:message)).not_to be_persisted }
    end
  end
end
