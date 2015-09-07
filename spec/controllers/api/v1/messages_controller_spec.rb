require 'rails_helper'

RSpec.describe Api::V1::MessagesController, type: :controller do
  describe 'GET #index' do
    let!(:messages) { create_list(:message, 5) }

    before { get :index }

    it { expect_status(200) }
    it { expect_json('messages.0', text: messages.first.text) }
  end
end
