require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it { expect(response).to have_http_status(:success) }
  end

  describe 'POST #create' do
    let!(:user) { create(:user) }

    before { post :create, params }

    context 'with valid credentials' do
      let(:params) { { email: user.email, password: 'password' } }

      it { expect(response).to redirect_to(channels_path) }
    end

    context 'with invalid email' do
      let(:params) { { email: 'dne@example.com', password: 'password' } }

      it { expect(response).to render_template(:new) }
    end

    context 'with invalid password' do
      let(:params) { { email: user.email, password: 'wrongpassword' } }

      it { expect(response).to render_template(:new) }
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create(:user) }

    before do
      login_user(user)
      delete :destroy
    end

    it { expect(response).to redirect_to(root_path) }
  end
end
